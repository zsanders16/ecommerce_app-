Rails.application.routes.draw do
  
  get 'shopping_carts/index'

  get 'items/index'

  get 'items/show'

  get 'items/new'

  get 'items/edit'

  get 'categories/index'

  get 'categories/new'

  get 'categories/edit'

  devise_for :users

  
  root "categories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
