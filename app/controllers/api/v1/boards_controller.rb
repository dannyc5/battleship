class Api::V1::BoardsController < ApplicationController
  def show
    board = Board.find params[:id]
    render json: board, serializer: HumanBoardSerializer, root: 'board'
  end

  def create
    human = Human.find board_params[:player_id]
    result = HumanBoardCreator.new(human, board_params[:ships]).execute
    binding.pry
    if result.success?
      render json: result.board, serializer: HumanBoardSerializer, root: 'board'
    else
      render json: {errors: result.errors}, status: 422
    end
  end

  private

  def board_params
    params.require(:board).permit(:player_id, :ships => [:row, :column])
  end
end
