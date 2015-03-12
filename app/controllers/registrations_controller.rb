class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_scope!, :only => [:update]
  before_action :authenticate_user_from_token!, :only => [:update]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { user: @user }, status: :created
    else
      render json: { messages: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if current_user.update(user_params)
      render json: { user: current_user }, status: :ok
    else
      render json: { error: "User info was not update" }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :profile_type)
  end
end
