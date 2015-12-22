class Api::V1::BoardsController < ApplicationController
  def create
    human = Human.find board_params[:player_id]
    result = HumanBoardCreator.new(human, board_params[:ships]).execute

    if result.success?
      render json: result.board, serializer: HumanBoardSerializer, root: 'board'
    else
      render json: {errors: result.errors.messages}, status: 422
    end
  end

  private

  def board_params
    params.require(:board).permit(:player_id, :ships => [:row, :column])
  end
end
