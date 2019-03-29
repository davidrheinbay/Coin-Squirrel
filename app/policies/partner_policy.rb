class PartnerPolicy < ApplicationPolicy

  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.where("name != ? and deleted = false", "CoinSquirrel")
    end
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
