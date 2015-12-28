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
    ship = Ship.find_by ship_params
    render json: ship, serializer: ShipSerializer
  end

  private

  def ship_params
    params.require(:ship).permit(:board_id, :row, :column)
  end
end
