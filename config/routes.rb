Rails.application.routes.draw do
  
  namespace :api do 
    namespace :v1 do 
      resources :items, except: [:new, :edit] do 
        get 'merchant', to: 'items/merchants#show'
      end
      get 'items/find_all', controller: 'items/search', action: 'find_all'
      get 'merchants/find_all', controller: 'merchants/search', action: 'find_all'
      resources :merchants, except: [:new, :edit] do 
        resources :items, only: [:index], controller: 'merchants/items'
      end
      
    end
  end
end
