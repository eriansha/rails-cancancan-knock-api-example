module API
  module V1
    module Customers
      class SomethingsController < ApplicationController
        before_action :authenticate_user
        authorize_resource class: :'API::V1::Customers::SomethingsController'

        def index
          products = API::V1::Admins::Products::FilterManager.execute
          render(
            json: products,
            root: 'products'
          )
        end

        def show
          product = API::V1::Admins::Products::ShowManager.execute(id: show_params[:id])
          render(
            json: product,
            root: 'product'
          )
        end

        def create
          render( json: 'Product is created', root: 'product')
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
