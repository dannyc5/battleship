class Api::V1::PlayersController < ApplicationController
  def create
    game = Game.find player_params[:game_id]
    if game.human.present?
      render json: {errors: human.errors.messages}, status: 422
    else
      human = game.create_human! name: player_params[:name]
      human.create_board!
      render json: human, serializer: PlayerSerializer
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :game_id)
  end
end
