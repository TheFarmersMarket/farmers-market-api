class FarmersController < ApplicationController
  before_action :authenticate_user_from_token!, only: [:update]

  def show
    @farmer = Farmer.find(params[:id])
    render json: { farmer: @farmer }, status: :ok
  end

  def update
    @farmer = Farmer.find(params[:id])
    @farmer.update(farmer_params)
    if @farmer.save
      render json: { farmer: @farmer }, status: :ok
    else
      render json: { message: "Farmer profile not updated" }, status: :unprocessable_entity
    end
  end

  def destroy
    @farmer = Farmer.find(params[:id])
    @farmer.destroy
    render json: { farmer: "Farmer was deleted" }, status: :ok
  end

  private
    def farmer_params
      params.require(:farmer).permit(:location, :business_phone, :farm, :crops, :contact_name)
    end
end

