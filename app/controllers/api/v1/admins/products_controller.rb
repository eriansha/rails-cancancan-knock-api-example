module API
  module V1
    module Admins
      class ProductsController < ApplicationController
        before_action :authenticate_user
        load_and_authorize_resource class: 'Product'

        def index
          @products = Product.all
          render(
            json: @products,
            root: 'products'
          )
        end

        def create
          Product.create!(
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
          product = Product.find_by(id: show_params[:id])
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
            :color,
            :condition,
            :price,
            :quantity
          )
        end

      end

    end
  end
end
