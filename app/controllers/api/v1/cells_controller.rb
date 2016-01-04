class Api::V1::CellsController < ApplicationController
  def show
    cell = Cell.find params[:id]
    serializer = cell.player_board.is_a?(HumanBoard) ? CellSerializer : SecretCellSerializer
    render json: cell, serializer: serializer
  end
end
