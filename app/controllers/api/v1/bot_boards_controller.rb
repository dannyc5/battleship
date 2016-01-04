class Api::V1::BotBoardsController < ApplicationController
  def show
    bot = BotBoard.find(params[:id])
    render json: bot
  end
end
