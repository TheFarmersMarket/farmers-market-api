class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate(auth_options)
    if self.resource
      sign_in(resource_name, resource, store: false)
      render "sessions/create.json.jbuilder", status: :created
    else
      render json: { error: "Authentication Failed!" }, status: :unauthenticated
    end
  end
end
