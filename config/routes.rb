Rails.application.routes.draw do
  root to: 'homepage#show'

  namespace :api do
    resource :authentication, only: [:create] do
      member do
        post :add_user
      end
    end
    resources :questions, only: [:index, :create, :update] do
      member do
        post :vote
      end
    end
  end

  defaults format: :html do
    get '/*path', to: redirect('/')
  end
end
