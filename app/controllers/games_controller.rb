class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def create
    game = Game.create
    game.create_human(name: human_params[:name])
    game.create_bot(name: BotNameGenerator.instance.execute)
    render json: game, serializer: GameSerializer
  end

  private

  def human_params
    params.require(:human).permit(:name)
  end
end
