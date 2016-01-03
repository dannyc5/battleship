class Api::V1::BotsController < ApplicationController
  def show
    bot = Bot.find(params[:id])
    render json: bot
  end
end
