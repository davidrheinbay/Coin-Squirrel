class TransactionsController < ApplicationController

  def index
    @transactions = policy_scope(Transaction).order(created_at: :desc)
  end
end
