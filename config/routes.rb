Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  authenticated :user do
      root 'users#current_user_home', as: :authenticated_root
      get 'home', to: 'home#index'    
  end 
  
  root to: "home#index"
  
  resources :users do
  	resources :meetings
  end
  
  
end
