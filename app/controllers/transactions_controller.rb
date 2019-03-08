class TransactionsController < ApplicationController

  def index
    @transactions = policy_scope(Transaction).order(created_at: :desc)
  end

  def new
    @transaction = Transaction.new
    authorize @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)
    authorize @transaction

    if @transaction.transaction_type == 'cash_out'
      transaction = create_cashout_transaction(@transaction)
      if transaction.save!
        current_user.balance_cents -= transaction.user_commission_amount_cents
        current_user.save
        redirect_to transactions_path
      else
        render :new
      end
    else
      puts 'ney'
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:user_commission_amount_cents, :transaction_type)
  end

  def create_cashout_transaction(transaction)
    user = current_user
    game = Game.find(user.game_id)

    transaction.user_id = user.id
    transaction.game_id = game.id
    transaction.transaction_confirmed_date = DateTime.now
    transaction.eur_currency_rate = ExchangeRate.where("game_id = ? AND currency_origin_short = ? AND created_at < ?", game, 'EUR', DateTime.now).last.rate
    transaction.user_commission_amount_cents = transaction.user_commission_amount_cents / transaction.eur_currency_rate * 100

    transaction.user_commission_amount_currency = 'EUR'

    # would be better if set equal to created_at date right after creation
    transaction.transaction_confirmed_date = DateTime.now
    transaction.state = "confirmed"
    transaction.link_used = call_giftbit_api['gift_link']
    transaction
  end

  def call_giftbit_api
    GiftbitLoader.new.call
  end
end

    # t.integer "user_commission_amount_cents", default: 0, null: false
    # t.string "transaction_type"

    # t.bigint "user_id"
    # t.integer "gmv_eur_cents", default: 0, null: false
    # t.string "gmv_eur_currency", default: "EUR", null: false
    # t.float "commission_perc"
    # t.float "user_commission_share_perc"
    # t.datetime "transaction_confirmed_date"
    # t.datetime "transaction_completed_date"
    # t.string "state"
    # t.index ["game_id"], name: "index_transactions_on_game_id"
    # t.index ["partner_id"], name: "index_transactions_on_partner_id"
    # t.index ["user_id"], name: "index_transactions_on_user_id"
