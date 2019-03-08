class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @partners = Partner.all
    @games = search_games

    if user_signed_in? == true
      @game = Game.find(current_user.game.id)
    else
      @game = Game.find_by_name("Fortnite")
    end
  end

  private

  def find_game
    if params[:game].blank?
      Game.find_by_name("Fortnite")
    else
      Game.find(params[:game])
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
