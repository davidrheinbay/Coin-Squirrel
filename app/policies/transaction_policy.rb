class TransactionPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.where(user_id: user)
    end
  end
end
