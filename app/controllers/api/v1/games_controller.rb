class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    game = Game.find params[:id]
    render json: game, serializer: GameSerializer, include: %w(players, players.board)
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
