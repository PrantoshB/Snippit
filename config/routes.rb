Rails.application.routes.draw do
  devise_for :users

  root "public#homepage"

  get '/contributors', to: 'contributors#index'

  resources :code_snippets, path: 'snippets' do 
    resources :ratings, only: [:new, :create, :destroy, :edit, :update]
    resources :comments, only: [:create, :destroy, :edit, :update]
  end


end
