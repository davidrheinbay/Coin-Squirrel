require 'open-uri'

class AwinGetTransactions
  def initialize(days)
    @api_key = ENV["AWIN_API_KEY"]
    @publisher_id = ENV["AWIN_PUBLISHER_ID"]
    @days = days || 3
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
    p @payload
    # commission_amount = @payload['commissionAmount']
    # sale_amount = @payload['saleAmount']
    # click_refs = @payload['clickRefs']

    # #if exists update else create new
    # if Transaction.find_by_awin_transaction_id(@payload["id"])
    #   transaction = Transaction.find_by_awin_transaction_id(@payload["id"])
    #   if @payload["state"] == "approved"
    #     transaction.state = "completed"
    #   elsif @payload["state"] == "pending"
    #   else
    #     transactionpayload["state"] = "canceled"
    #   end
    #   transaction.update
    # else
    #   # should only calc parameters and send to Transaction#CREATE
    #   transaction = Transaction.new
    #   user = User.find(click_refs["clickRef2"])
    #   game = Game.find(user.game_id)
    #   partner = Partner.find_by_awin_transaction_id(payload["advertiserId"])
    #   transaction_date = DateTime.parse(payload["transactionDate"])
    #   user_commission_share_perc = partner.user_commission_share_perc
    #   transaction.user_id = user.id
    #   transaction.transaction_type = "cash_in"
    #   transaction.gmv_eur_cents = (sale_amount["amount"] * 100).to_i
    #   transaction.gmv_eur_currency = sale_amount["currency"]
    #   transaction.commission_perc = (commission_amount["amount"] / sale_amount["amount"])
    #   transaction.user_commission_share_perc = user_commission_share_perc
    #   transaction.user_commission_amount_cents = commission_amount["amount"] * user_commission_share_perc
    #   transaction.user_commission_amount_currency = sale_amount["currency"]
    #   transaction.eur_currency_rate = ExchangeRate.where("game_id = ? AND \
    #                                                       currency_origin_short = ? AND \
    #                                                       created_at < ?",
    #                                                       game.id,
    #                                                       sale_amount["amount"],
    #                                                       transaction_date
    #                                                       ).last.rate
    #   transaction.partner_id = partner.id
    #   transaction.game_id = game.id
    #   # would be better if set equal to created_at date right after creation
    #   transaction.transaction_confirmed_date = DateTime.now.in_time_zone("UTC")
    #   transaction.state = "confirmed"
    #   transaction.create
  end
end

