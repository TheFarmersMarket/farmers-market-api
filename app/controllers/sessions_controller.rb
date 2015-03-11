class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate(auth_options)
    if self.resource
      sign_in(resource_name, resource, store: false)
      if current_user.temp_password?
        render json: { user: current_user, temp_password: true }, status: :ok
      else
        render json: { user: current_user }, status: :ok
      end
    else
      render json: { error: "Authentication Failed!" }, status: :unauthenticated
    end
  end
end