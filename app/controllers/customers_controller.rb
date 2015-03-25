class CustomersController < ApplicationController
  before_action :authenticate_user_from_token!, :only => [:update, :destroy, :follow, :unfollow, :all_following]
  before_action :set_farmer, only: [:follow, :unfollow]
  before_action :set_customer, only: [:follow, :show, :destroy, :update, :unfollow, :all_following]

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

  def follow
    if current_user.id == @customer.user_id
      @customer.follow(@farmer)
      render "customers/follow.json.jbuilder", status: :created
    else
      render json: { :error => "unauthorized"}, status: :not_found
    end
  end

  def unfollow
    if current_user.id == @customer.user_id
      @customer.stop_following(@farmer)
      render "customers/unfollow.json.jbuilder", status: :ok
    else
      render json: { :error => "unauthorized" }, status: :not_found
    end
  end

  def all_following
    if current_user.id == @customer.user_id
      @results = @customer.all_following
      # render json: { customer: @customer.all_following }, status: :ok
      render "customers/allfollowing.json.jbuilder", status: :ok
    else
      render json: { :error => "unauthorized" }, status: :not_found
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
