class FavgamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def edit

  end

  def update
    @favgame = Game.find(params[:id])

    current_user.game = @favgame
    authorize current_user
    current_user.save

    redirect_back(fallback_location: root_path)
  end
end
