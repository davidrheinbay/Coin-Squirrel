class TransactionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user).order(transaction_confirmed_date: :desc)
    end
  end
end
