require 'json'
require 'open-uri'

class GamesController < ApplicationController
  #skip_before_action :authenticate_user!, only: :show

  def show
    @game = current_user.game
    authorize @game

    @games = policy_scope(Game)

    @items = @game.fetch_items
  end

  def index
    @games = policy_scope(Game)
  end
end
