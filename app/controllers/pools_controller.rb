class PoolsController < ApplicationController

  def index
    @pools = Pool.all
    render json: @pools
  end

  def show
    @pool = Pool.find(params[:id])
    render json: @pool
  end

  def create
    @pool = Pool.new(pool_params)
    if @pool.save
      render json: @pool, status: :accepted
    else
      render json: { errors: @pool.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @pool = Pool.find(params[:id])
    @pool.active = params[:pool][:active]
    if @pool.save
      render json: @pool, status: :accepted
    else
      render json: { errors: @pool.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def pool_params
    params.permit(:active)
  end

end
