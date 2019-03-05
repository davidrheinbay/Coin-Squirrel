class PartnersController < ApplicationController

  def index
    @partners = policy_scope(Partner).order(created_at: :desc)
  end
end
