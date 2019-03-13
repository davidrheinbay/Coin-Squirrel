class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :imprint, :terms, :data_protection, :about]

  def home
    @partners = Partner.where("name != ? and card_image IS NOT NULL", "CoinSquirrel")
    @games = search_games
    if user_signed_in? == true
      @game = Game.find(current_user.game.id)
    elsif params[:game].nil?
      @game = Game.find_by_name('Fortnite')
    else
      # POTENTIAL ERROR IN RESPOND TO FORMAT AND POSITION
      respond_to do |format|
        format.html
        format.js
      end
      @game = Game.find(params[:game])
    end
  end

  def imprint
  end

  def data_protection
  end

  def terms
  end

  def about
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
