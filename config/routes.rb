Rails.application.routes.draw do
  get 'sessions/new'
  resources :posts do
    collection do
      post :confirm
    end
  end
  root "posts#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :users do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener_web" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
