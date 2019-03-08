require 'json'
require 'open-uri'

class GamesController < ApplicationController
  #skip_before_action :authenticate_user!, only: :show

  def show
    @game = Game.find(params[:id])
    authorize @game

    if params[:id] == 2
      @items = PubgItemsLoader.call
    else
      @items = FortniteItemsLoader.call
    end
  end

  def index
    @games = policy_scope(Game)
  end
end
