class Api::V1::HumansController < ApplicationController
  def show
    human = Human.find(params[:id])
    render json: human
  end

  def create
    game = Game.find player_params[:game_id]
    if game.human.present?
      render json: game.human
    else
      human = game.create_human! name: player_params[:name]
      human.create_board!
      render json: human
    end
  end

  private

  def player_params
    params.require(:human).permit(:name, :game_id)
  end
end
