class Api::V1::ShipsController < ApplicationController
  def create
    ship = Ship.new ship_params
    if ship.save
      render json: ship, serializer: ShipSerializer
    else
      render json: {errors: ship.errors.messages}, status: 422
    end
  end

  def show
    ship = Ship.find params[:id]
    render json: ship, serializer: ShipSerializer
  end

  def index
    board = Board.find params[:board_id]
    ships = Ship.where(board_id: params[:board_id])
    render json: ships, each_serializer: ShipSerializer
  end

  private

  def ship_params
    params.require(:ship).permit(:cell_id)
  end
end
