class CropsController < ApplicationController
  before_action :authenticate_user_from_token!, only: [:create, :update, :destroy]

  def create
    @crop = current_user.farmer.crops.build(crop_params)
    if @crop.save
      render "crop/create.json.jbuilder", status: :created
    else 
      render json: { messages: @crop.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @crop = Crop.find(params[:id])
    if @crop.update(crop_params)
      render "crop/update.json.jbuilder", status: :created
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
    params.require(:crop).permit(:price, :currency, :quantity, :crop_name, :farmer_id)
  end
end
