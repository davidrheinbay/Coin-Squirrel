class TransactionsController < ApplicationController
  def index
    @transactions = policy_scope(Transaction).order(created_at: :desc)

    @amount = current_user.balance * current_user.game.exchange_rates.where(currency_origin_short: "EUR").last.rate

  end

  def new
    @transaction = Transaction.new
    authorize @transaction

    @value = params[:value]
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.game_code = code_faker

    @transaction = create_cashout_transaction(@transaction)
    authorize @transaction

    if current_user.balance_cents >= @transaction.user_commission_amount_cents

      if @transaction.save
        current_user.balance_cents -= @transaction.user_commission_amount_cents
        current_user.save
        redirect_to transactions_path
      else
        render :new
      end
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:user_commission_amount_cents, :transaction_type, :game_code)
  end

  def create_cashout_transaction(transaction)
    user = current_user
    game = Game.find(user.game_id)

    transaction.user_id = user.id
    transaction.game_id = game.id
    transaction.transaction_confirmed_date = DateTime.now
    transaction.eur_currency_rate = ExchangeRate.where("game_id = ? AND currency_origin_short = ? AND created_at < ?", game, 'EUR', DateTime.now).last.rate
    transaction.user_commission_amount_cents = (transaction.user_commission_amount_cents.to_f / transaction.eur_currency_rate.to_f * 100.to_f).round(0).to_i

    transaction.user_commission_amount_currency = 'EUR'

    # would be better if set equal to created_at date right after creation
    transaction.state = "confirmed"
    transaction.link_used = call_giftbit_api(transaction.id)['gift_link']
    transaction
  end

  def call_giftbit_api(transaction_id)
    GiftbitLoader.new.call(transaction_id)
  end

  def code_faker
    ary = [('0'..'9').to_a, ('A'..'Z').to_a]
    code = ''

    16.times do
      code << (ary[rand(0..1)].join(""))[rand(0..9)]
    end
    code
  end
end
