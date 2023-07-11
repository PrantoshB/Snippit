Rails.application.routes.draw do
  devise_for :users

  root "public#homepage"

  resources :code_snippets, path: 'snippets' do 
    resources :stars, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
    resources :ratings, only: [:new, :create, :destroy, :edit, :update]
    resources :comments, only: [:create, :destroy, :edit, :update]
  end

  resources :contributors do
    resources :code_snippets, path: 'snippets', only: [:index]
  end

end
