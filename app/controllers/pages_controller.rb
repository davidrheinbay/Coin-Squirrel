class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @partners = Partner.all
    if params[:query].blank?
      @games = Game.all
    else
      @games = Game.where("name ILIKE ?", params[:query])
    end
  end
end
