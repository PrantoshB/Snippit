Rails.application.routes.draw do
  devise_for :users

  namespace :api do 
    namespace :v1 do 
      resources :snippets
      resources :contributors
    end
  end

end
