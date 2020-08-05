module Api
  module V1
    module Admins
      #
      class ProductsController < ApplicationController
        before_action :authenticate_user

        def index
          index_param
        end

        private

        def index_param
          params.merge(current_user)
        end

      end

    end
  end
end
