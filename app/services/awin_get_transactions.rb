require 'open-uri'

class AwinGetTransactions
  def initialize(days = 3)
    @api_key = ENV["AWIN_API_KEY"]
    @publisher_id = ENV["AWIN_PUBLISHER_ID"]
    @days = days
  end

  def call
    fetch_programmes
  end

  def fetch_programmes
    end_date = Date.yesterday.strftime("%Y-%m-%dT23:59:59")
    start_date = (Date.yesterday - @days).strftime("%Y-%m-%dT00:00:00")
    api_uri = "https://api.awin.com/publishers/\
#{@publisher_id}/transactions/\
?startDate=#{start_date}&endDate=#{end_date}&\
timezone=UTC&accessToken=#{@api_key}"
    @payload = JSON.parse(open(api_uri).read)[0]
    parse_payload
  end

  private

  def parse_payload
    @commission_amount = @payload['commissionAmount']
    @sale_amount = @payload['saleAmount']
    admin_id = User.find_by_email("devs@coinsquirrel.de").id
    @click_refs = @payload['clickRefs'] || { "clickRef2" => admin_id }

    # if exists update else create new
    if Transaction.find_by_awin_transaction_id(@payload["id"])
      update_transaction_state
    else
      create_transaction
    end
  end

  # UPDATING METHODS

  def update_transaction_state
    @transaction = Transaction.find_by_awin_transaction_id(@payload["id"])
    if @payload["state"] == "approved"
      approve_transaction
    elsif @payload["state"] == "pending"
    else
      cancel_transaction
    end
  end

  def cancel_transaction
    reduce_balance if @transaction.state == "completed"
    @transaction.state = "canceled"
    increase_balance unless @transaction.save
  end

  def approve_transaction
    @transaction.state = "completed"

    increase_balance(transaction) if @transaction.save
  end

  def increase_balance
    current_user.balance_cents += @transaction.user_commission_amount_cents
    current_user.save
  end

  def reduce_balance
    current_user.balance_cents -= @transaction.user_commission_amount_cents
    current_user.save
  end

  # CREATE METHODS

  def create_transaction
    # should only calc parameters and send to Transaction#CREATE
    @transaction = Transaction.new
    # set transaction ID
    @transaction.awin_transaction_id = @payload["id"]
    # set link used NEEDS TO BE CHANGED AFTER WE GET TEST DATA
    @transaction.link_used = @payload["url"]
    # setting user
    @user = User.find(@click_refs["clickRef2"])
    @transaction.user_id = @user.id
    # setting game
    @transaction.game_id = @user.game_id
    # setting partner NEEDS ESCAPE FOR NOT FOUND
    @partner = Partner.find_by_awin_advertiser_id(@payload["advertiserId"])
    @transaction.partner_id = @partner.id
    # calculate other parameters
    calc_transaction_values
    # create transaction and redirect
    @transaction.save

    # WHAT HAPPENS IF IT DOESN'T SAVE?
  end

  def calc_transaction_values
    # settings dates
    @transaction_date = DateTime.parse(@payload["transactionDate"])
    # would be better if set equal to created_at date right after creation
    @transaction.transaction_confirmed_date = DateTime.now.in_time_zone("UTC")

    # settings type & state
    @transaction.transaction_type = "cash_in"
    @transaction.state = "confirmed"

    # calculating commisstion
    calc_commission
  end

  def calc_commission
    user_commission_share_perc = @partner.user_commission_perc
    @transaction.gmv_eur_cents = (@sale_amount["amount"] * 100).to_i
    @transaction.gmv_eur_currency = @sale_amount["currency"]
    @transaction.commission_perc = (@commission_amount["amount"] / @sale_amount["amount"])
    @transaction.user_commission_share_perc = user_commission_share_perc
    @transaction.user_commission_amount_cents = @commission_amount["amount"] * user_commission_share_perc
    @transaction.user_commission_amount_currency = @sale_amount["currency"]
    # settings exchange rate
    set_exchange_rate(@transaction.game_id, @sale_amount["currency"], @transaction_date)
  end

  def set_exchange_rate(game_id, currency, transaction_date)
    exchange_rate = ExchangeRate.where("game_id = ? AND \
                                       currency_origin_short = ? AND \
                                       created_at < ?",
                                       game_id,
                                       currency,
                                       transaction_date).last || ExchangeRate.first
    @transaction.eur_currency_rate = exchange_rate.rate
  end
end
