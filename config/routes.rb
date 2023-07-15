Rails.application.routes.draw do
  devise_for :users

  # root "public#homepage"

  namespace :api do 
    namespace :v1 do 
      resources :code_snippets
    end
  end

  # resources :code_snippets, path: 'snippets' do 
  #   resources :stars, only: [:create, :destroy]
  #   resources :bookmarks, only: [:create, :destroy]
  #   resources :ratings, only: [:new, :create, :destroy, :edit, :update]
  #   resources :comments, only: [:create, :destroy, :edit, :update]
  # end

  resources :contributors do
    resources :code_snippets, path: 'snippets', only: [:index]
  end

end
