Rails.application.routes.draw do
  root to: 'homepage#show'

  resource :authentication, only: [:create]
  resources :questions, only: [:index, :create, :update] do
    member do
      post :vote
    end
  end

  defaults format: :html do
    get '/*path', to: redirect('/')
  end
end
