Rails.application.routes.draw do
  devise_for :users

  namespace :api do 
    namespace :v1 do 
      resources :code_snippets
      resources :contributors
    end
  end

  resources :contributors do
    resources :code_snippets, path: 'snippets', only: [:index]
  end

end
