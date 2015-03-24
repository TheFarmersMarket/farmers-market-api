class CropsController < ApplicationController
  before_action :authenticate_user_from_token!, only: [:create, :update, :destroy]

  def create
    @crop = current_user.farmer.crops.build(crop_params)
    if @crop.save
      render :create, status: :created
    else 
      render json: { messages: @crop.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @crop = Crop.find(params[:id])
    if @crop.update(crop_params)
      render :update, status: :created
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
    params.require(:crop).permit(:price, :currency, :quantity, :crop_name, :farmer_id, :avatar, :unit)
  end

  #def pic_params
  #  params.require(:crop).permit(:avatar)
  #end
end
