class Api::V1::MovesController < ApplicationController
  def create
    move = Move.new move_params

    if move.save
      game = move.game
      game.respond_to_human_board!
      render json: move, serializer: MoveSerializer
    else
      render json: {errors: move.errors.messages}, status: 422
    end
  end

  def show
    move = Move.find params[:id]
    render json: move, serializer: MoveSerializer
  end

  def index
    player_board = PlayerBoard.find params[:player_board_id]
    render json: player_board.moves, each_serializer: MoveSerializer
  end

  private

  def move_params
    params.require(:move).permit(:cell_id)
  end
end
