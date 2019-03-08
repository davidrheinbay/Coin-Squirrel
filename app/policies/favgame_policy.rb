class FavegamePolicy < ApplicationPolicy

  def update?
    return true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
