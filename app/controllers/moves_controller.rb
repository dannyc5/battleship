class MovesController < ApplicationController
  def create
    move = Move.new move_params

    if move.save
      render json: move, serializer: MoveSerializer
    else
      render json: {errors: move.errors.messages}, status: 422
    end
  end

  private

  def move_params
    params.require(:move).permit(:player_id, :row, :column)
  end
end
