Rails.application.routes.draw do


  root 'users#index'

  resources :users do
    collection do
      get 'search'
    end
    member do
      get :challenged, :challengers
    end
  end


  resources :relationships, only: [:create, :destroy, :index]


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end
