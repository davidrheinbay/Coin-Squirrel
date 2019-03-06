class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @partners = Partner.all
    @game = find_game
    @games = search_games
  end

  private

  def find_game
    if params[:game].blank?
      Game.find_by_name(params["Fortnite"])
    else
      Game.find_by_name(params[:game])
    end
  end

  def search_games
    if params[:query].blank?
      Game.all
    else
      Game.where("name ILIKE ?", params[:query])
    end
  end
end
