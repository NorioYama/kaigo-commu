Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'
  resources :posts do
    resources :comments, only: :create
    collection do
      get 'search'
      get 'tag_search'
    end
  end
end
