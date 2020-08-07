module API
  module V1
    module Admins
      class ProductsController < ApplicationController
        before_action :authenticate_user
        authorize_resource class: :'API::V1::Admins::ProductsController'

        def index
          products = API::V1::Admins::Products::FilterManager.execute
          render(
            json: products,
            root: 'products'
          )
        end

        def create
          product = API::V1::Admins::Products::CreateManager.execute(
            name: create_params[:name],
            brand: create_params[:brand],
            category: create_params[:category],
            colour: create_params[:colour],
            condition: create_params[:condition],
            price: create_params[:price],
            quantity: create_params[:quantity]
          )
          render(
            json: product,
            root: 'product'
          )
        end

        def assign
          API::V1::Admins::Products::CreateManager.execute(
            name: create_params[:name],
            brand: create_params[:brand],
            category: create_params[:category],
            colour: create_params[:colour],
            condition: create_params[:condition],
            price: create_params[:price],
            quantity: create_params[:quantity]
          )
        end

        def show
          product = API::V1::Admins::Products::ShowManager.execute(id: show_params[:id])
          render(
            json: product,
            root: 'product'
          )
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
