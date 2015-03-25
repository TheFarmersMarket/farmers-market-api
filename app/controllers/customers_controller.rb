class CustomersController < ApplicationController
  before_action :authenticate_user_from_token!, :only => [:update, :destroy, :follow]
  before_action :set_farmer, only: [:follow]
  before_action :set_customer, only: [:follow, :show, :destroy, :update]

  def edit
  end

  def show
    render :show, status: :ok
  end

  def update
    @customer.update(customer_params)
    if @customer.save!
      render json: { :customer => @customer }, status: :ok
    else
      render json: { messages: @customer.errors.full_messages },
                    status: :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy!
    render json: { customer: "Customer was Deleted" }, status: :ok
  end

  def pic
    @customer = Customer.find(params[:customer_id])
    @customer.update(pic_params)
    render json: { pic: @customer.avatar.url(:medium) }, status: :created
  end

  def follow(follower_email)
    if current_user.id == @customer.user_id
      @customer.follow(@farmer)
      render "customers/follow.json.jbuilder", status: :created
    else
      render json: { :error => "unauthorized"}, status: :not_found
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:business, :business_phone, :location, :contact_name, :avatar)
  end

  def set_farmer
    @farmer = Farmer.find(params[:farmer][:id])
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def pic_params
    params.require(:customer).permit(:avatar)
  end
end
