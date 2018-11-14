class StocksController < ApplicationController

  def index
    @stocks = Stock.all
    render json: @stocks
  end

  def show
    @stock = Stock.find(params[:id])
    render json: @stock
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      render json: @stock, status: :accepted
    else
      render json: { errors: @stock.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def stock_params
    params.permit(:name, :ticker, :industry)
  end

end
