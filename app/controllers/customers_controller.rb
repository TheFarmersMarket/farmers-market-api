class CustomersController < ApplicationController
  before_action :authenticate_user_from_token!, :only => [:update, :destroy]

  def edit
  end

  def show
    @customer = Customer.find(params[:id])
    render :show, status: :ok
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    if @customer.save!
      render json: { :customer => @customer }, status: :ok
    else
      render json: { messages: @customer.errors.full_messages },
                    status: :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy!
    render json: { customer: "Customer was Deleted" }, status: :ok
  end

  def pic
    @customer = Customer.find(params[:customer_id])
    @customer.update(pic_params)
    render json: { pic: @customer.avatar.url(:medium) }, status: :created
  end

  private
  def customer_params
    params.require(:customer).permit(:business, :business_phone, :location, :contact_name, :avatar)
  end

  def pic_params
    params.require(:customer).permit(:avatar)
  end
end
