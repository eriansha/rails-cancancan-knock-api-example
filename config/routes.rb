Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :admins do
        resources :products, only: %i[index create show] do
          collection do
            post 'assign'
          end
        end

        resources :users, only: %i[index create show]

      end

      namespace :customers do
        resources :somethings, only: %i[index create show] do
          collection do
            post 'assign'
          end
        end

      end

      namespace :authentication do
        post 'login' => 'user_token#create'
      end
    end
  end
end
