class PartnersController < ApplicationController

  def index
    @partners = policy_scope(Partner).order(created_at: :desc)
  end

  def show
    @partner = Partner.find(params[:id])
    authorize @partner
  end
end
