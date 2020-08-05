Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :admins do
      
        resources :products, only: [:index]
      end

      namespace :authentication do
        post 'login' => 'user_token#create'
      end
    end
  end
end
