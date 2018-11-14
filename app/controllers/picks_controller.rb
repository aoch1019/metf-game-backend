class PicksController < ApplicationController

  def index
    @picks = Pick.all
    render json: @picks
  end

  def show
    @pick = Pick.find(params[:id])
    render json: @pick
  end

  def create
    @pick = Pick.new(pick_params)
    if @pick.save
      render json: @pick, status: :accepted
    else
      render json: { errors: @pick.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @pick = Pick.find(params[:id])
    @pick.init_price = params[:pick][:init_price]
    if @pick.save
      render json: @pick, status: :accepted
    else
      render json: { errors: @pick.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @pick = Pick.find(params[:id])
    @pick.destroy
  end

  private

  def pick_params
    params.permit(:init_price, :etf_id, :stock_id)
  end

end
