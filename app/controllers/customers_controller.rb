class CustomersController < ApplicationController
  before_action :authenticate_user_from_token!, :only => [:update, :destroy]

  def edit
  end

  def show
    @customer = Customer.find(params[:id])
    render json: {:customer => @customer}
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    if @customer.save!
      render json: {:customer => @customer}, status: :updated
    else
      render json: {messages: @customer.errors.full_messages},
                    status: :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy!
    render json: {customer: "Customer was Deleted"}, status: :ok
  end

  private
  def customer_params
    params.require(:customer).permit(:business, :business_phone, :location, :contact_name)
  end
end
