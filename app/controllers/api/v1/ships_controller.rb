class Api::V1::ShipsController < ApplicationController
  def create
    ship = Ship.create! ship_params
    render json: ship, serializer: ShipSerializer
  end

  private

  def ship_params
    params.require(:ship).permit(:board_id, :row, :column)
  end
end
