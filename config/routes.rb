Rails.application.routes.draw do
  get 'sessions/new'
  resources :posts do
    collection do
      post :confirm
    end
  end
  root "posts#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :favorites
end
