class Api::V1::GamesController < ApplicationController
  def index
    if params[:id]
      game = Game.find params[:id]
      render json: game, serializer: GameSerializer
    else
      games = Game.all
      render json: games, each_serializer: GameSerializer
    end
  end

  def show
    game = Game.find params[:id]
    render json: game, serializer: GameSerializer
  end

  def create
    result = GameCreator.new.execute
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
end
