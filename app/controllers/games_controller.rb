require 'json'
require 'open-uri'

class GamesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :show

  def show
    @game = Game.find(params[:id])
    authorize @game
    url = 'https://fortnite-public-api.theapinetwork.com/prod09/store/get'

    shop = JSON.parse(open(url).read)
    @items = shop['items']
  end
end
