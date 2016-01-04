class Api::V1::CellsController < ApplicationController
  def index
    player_board = PlayerBoard.find params[:player_board_id]
    serializer = player_board.is_a?(HumanBoard) ? CellSerializer : SecretCellSerializer
    render json: player_board.cells, each_serializer: serializer
  end

  def show
    cell = Cell.find params[:id]
    serializer = cell.player_board.is_a?(HumanBoard) ? CellSerializer : SecretCellSerializer
    render json: cell, serializer: serializer
  end
end
