class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    game = Game.find params[:id]
    render json: game, serializer: GameSerializer
  end

  def create
    result = GameCreator.new(human_params[:name], human_params[:ships]).execute
    if result.success?
      render json: result.game, serializer: GameSerializer
    else
      render json: {errors: result.errors}, status: 422
    end
  end

  def destroy
    game = Game.find params[:id]
    game.destroy!
    render json: {}, status: :ok
  end

  private

  def human_params
    params.require(:human).permit(:name, ships: [:row, :column])
  end
end