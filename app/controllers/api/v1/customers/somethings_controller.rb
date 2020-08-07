module API
  module V1
    module Customers
      class SomethingsController < ApplicationController
        before_action :authenticate_user
        authorize_resource class: :'API::V1::Customers::SomethingsController'

        def index
          render(
            json: 'Showing multiple entity',
            root: 'something',
            status: :ok
          )
        end

        def show
          render(
            json: 'Showing single entity', 
            root: 'something',
            status: :ok
          )
        end

        def create
          render(json: 'Something is created', root: 'something')
        end

        private

        def index_param
          params.merge(current_user)
        end

        def show_params
          params.permit(:id)
        end

        def create_params
          params.permit(
            :name,
            :brand,
            :category,
            :colour,
            :condition,
            :price,
            :quantity
          )
        end

      end

    end
  end
end
