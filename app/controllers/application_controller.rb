class ApplicationController < ActionController::API
  include Knock::Authenticable
  include API::V1
end
