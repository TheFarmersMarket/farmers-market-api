class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :force_json_response!

  def authenticate_user_from_token!
    user_token = request.headers['auth-token']
    user_token ||= params[:auth_token].presence
    user       = user_token && User.find_by_authentication_token(user_token)

    if user
      sign_in user, store: false
    else
      render json: { :error => "Authentication Failed!" },
             status: :unauthenticated
    end
  end

  def force_json_response!
    request.format = :json
  end

  rescue_from ActiveRecord::RecordNotFound do
    render json: nil, status: :not_found
  end
end
