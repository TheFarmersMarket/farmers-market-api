class CropsController < ApplicationController

  def create
    @crop = Crop.new(crop_params)
    if @crop.save
      render json: { crop: @crop }, status: :created
    else 
      render json: { messages: @crop.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @crop = Crop.find(params[:id])
    if @crop.update(crop_params)
      render json: { crop: @crop }, status: :ok
    else
      render json: { messages: @crop.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @crop = Crop.find(params[:id])
    @crop.destroy!
    render json: { crop: "Crop was Deleted!" }, status: :ok
  end

  private
  def crop_params
    params.require(:crop).permit(:price, :currency, :quantity, :crop_name)
  end
end
