Rails.application.routes.draw do


  root 'users#index'

  post "users/:id/styles" => "users#add_to_styles", as: "user_add_style"
  resources :users do
    collection do
      get 'search'
    end
    member do
      get :challenged, :challengers
    end
  end

  resources :users do
    resources :styles, only: [:show]
  end

  resources :relationships, only: [:create, :destroy, :index]


  resources :styles

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end
