# Controller for JWT Token using Knock
module API
  module V1
    module Authentication
      class UserTokenController < Knock::AuthTokenController
        skip_before_action :verify_authenticity_token

        private
        
        def auth_params
          params.require(:auth).permit(:email, :password)
        end

      end
    end
  end
end
