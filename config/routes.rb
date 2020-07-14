Rails.application.routes.draw do
  # namespace :api do 
  #   namespace :v1 do 
  #   end
  # end
  
  namespace :api do 
    namespace :v1 do 
      resources :items, only: [:index, :show, :create, :destroy, :update]
  
      resources :merchants, except: [:new, :edit] do 
        resources :items, only: [:index], controller: 'merchants/items'
      end
      
      # namespace :merchants do 
        
      # end
    end
  end
end
