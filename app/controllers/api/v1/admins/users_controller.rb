module API
  module V1
    module Admins
      class UsersController < ApplicationController
        before_action :authenticate_user
        authorize_resource class: :'API::V1::Admins::UsersController'

        def index
          users = User.all
          render(
            json: users,
            root: 'users'
          )
        end

        def create
          byebug
          User.create(
            name: create_params[:name],
            email: create_params[:email],
            role: create_params[:role],
            password: create_params[:password]
          )
        end

        def show
          user = User.find(show_params[:id])
          render(
            json: user,
            root: 'user'
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
            :email,
            :role,
            :password
          )
        end

      end

    end
  end
end
