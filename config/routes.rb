Rails.application.routes.draw do
  devise_for :users
  root to: "profiles#index"

  resources :profiles do
    collection do
      get 'search'
    end
    resources :schedules
  end

  resources :dms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :boards, except: [:show] do
    resources :comments, only: [:index, :create, :destroy]
  end

  
  get 'boards/:id', to: 'boards#checked'
end
