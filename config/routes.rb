Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :authentication, only: [:show, :create]
  resources :questions, only: [:index, :create, :update] do
    member do
      post :vote
    end
  end

  root to: 'questions#index'
end
