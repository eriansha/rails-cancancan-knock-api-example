class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include Knock::Authenticable
  include API::V1

  rescue_from CanCan::AccessDenied do |exception|
    render json: { message: exception.message }, status: 403
  end
  
end
