class PartnerPolicy < ApplicationPolicy

  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.where("name != ?", "CoinSquirrel")
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
end
