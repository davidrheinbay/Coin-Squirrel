class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

    @partners = Partner.where("name != ?", "CoinSquirrel")
    @games = search_games

    if user_signed_in? == true
      @game = Game.find(current_user.game.id)
    else
      if params[:game].nil?
        @game = Game.find_by_name('Fortnite')
      else
        @game = Game.find(params[:game])
      end
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
