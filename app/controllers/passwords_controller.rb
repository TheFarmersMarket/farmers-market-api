class PasswordsController < Devise::PasswordsController
  before_action :authenticate_user_from_token!, only: [:update]

  def update
    # binding.pry
    @user = User.find(current_user.id)
    if @user.update(password_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      @user.update_attributes(:temp_password => nil)
      @user.save
      render json: { user: current_user }, status: :ok
    else
      render json: { error: "Couldn't update password" }, status: :unauthenticated
    end
  end


  private
  def password_params
    params.required(:user).permit(:password, :password_confirmation)
  end
end
