Rails.application.routes.draw do
  
  resources :categories do
    resources :items
  end
  
  resources :shopping_carts do
    patch :add_item
    patch :change_item_amount
    patch :remove_item
    resources :items
  end
  

  devise_for :users

  
  root "categories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
