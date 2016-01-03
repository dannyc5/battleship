class Api::V1::HumanBoardsController < ApplicationController
  def show
    human_board = HumanBoard.find(params[:id])
    render json: human_board
  end

  def create
    game = Game.find human_board_params[:game_id]
    if game.human_board.present?
      render json: game.human_board
    else
      human_board = game.create_human_board! name: human_board_params[:name]
      render json: human_board
    end
  end

  private

  def human_board_params
    params.require(:human_board).permit(:name, :game_id)
  end
end
