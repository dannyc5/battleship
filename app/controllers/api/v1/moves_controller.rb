class Api::V1::MovesController < ApplicationController
  # def create
  #   move = Move.new move_params

  #   if move.save
  #     game = move.game
  #     game.respond_to_human!

  #     render json: move, serializer: MoveSerializer
  #   else
  #     render json: {errors: move.errors.messages}, status: 422
  #   end
  # end

  # def index
  #   player = Player.find params[:player_id]
  #   moves = Move.where(player_id: params[:player_id])
  #   render json: moves, each_serializer: MoveSerializer
  # end

  # private

  # def move_params
  #   params.require(:move).permit(:player_id, :row, :column)
  # end
end
