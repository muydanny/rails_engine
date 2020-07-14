Rails.application.routes.draw do
  
  namespace :api do 
    namespace :v1 do 
      resources :items, except: [:new, :edit] do 
        resources :merchants, only: [:show], controller: 'items/merchants'
      end
  
      resources :merchants, except: [:new, :edit] do 
        resources :items, only: [:index], controller: 'merchants/items'
      end
      
    end
  end
end
