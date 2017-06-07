Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }

  resources :categories do
    resources :items
  end

  resources :shopping_carts do
    resources :items do
      patch :add_item
      patch :remove_item
      end
  end





  root "categories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
