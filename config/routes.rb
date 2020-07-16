Rails.application.routes.draw do
  
  namespace :api do 
    namespace :v1 do 

      get 'items/find_all', controller: 'items/search', action: 'index'
      get 'items/find', controller: 'items/search', action: 'show'
      resources :items, except: [:new, :edit] do 
        get 'merchant', to: 'items/merchants#show'
      end


      get 'merchants/find_all', controller: 'merchants/search', action: 'index'
      get 'merchants/find', controller: 'merchants/search', action: 'show'
      get 'merchants/most_revenue', controller: 'merchants/search', action: 'most_revenue'

      resources :merchants, except: [:new, :edit] do 
        resources :items, only: [:index], controller: 'merchants/items'
      end
      
    end
  end
end
