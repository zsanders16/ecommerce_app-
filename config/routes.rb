# == Route Map
#
#                           Prefix Verb     URI Pattern                                                            Controller#Action
#                 new_user_session GET      /users/sign_in(.:format)                                               devise/sessions#new
#                     user_session POST     /users/sign_in(.:format)                                               devise/sessions#create
#             destroy_user_session DELETE   /users/sign_out(.:format)                                              devise/sessions#destroy
# user_facebook_omniauth_authorize GET|POST /users/auth/facebook(.:format)                                         omniauth_callbacks#passthru
#  user_facebook_omniauth_callback GET|POST /users/auth/facebook/callback(.:format)                                omniauth_callbacks#facebook
#                new_user_password GET      /users/password/new(.:format)                                          devise/passwords#new
#               edit_user_password GET      /users/password/edit(.:format)                                         devise/passwords#edit
#                    user_password PATCH    /users/password(.:format)                                              devise/passwords#update
#                                  PUT      /users/password(.:format)                                              devise/passwords#update
#                                  POST     /users/password(.:format)                                              devise/passwords#create
#         cancel_user_registration GET      /users/cancel(.:format)                                                devise/registrations#cancel
#            new_user_registration GET      /users/sign_up(.:format)                                               devise/registrations#new
#           edit_user_registration GET      /users/edit(.:format)                                                  devise/registrations#edit
#                user_registration PATCH    /users(.:format)                                                       devise/registrations#update
#                                  PUT      /users(.:format)                                                       devise/registrations#update
#                                  DELETE   /users(.:format)                                                       devise/registrations#destroy
#                                  POST     /users(.:format)                                                       devise/registrations#create
#                   category_items GET      /categories/:category_id/items(.:format)                               items#index
#                                  POST     /categories/:category_id/items(.:format)                               items#create
#                new_category_item GET      /categories/:category_id/items/new(.:format)                           items#new
#               edit_category_item GET      /categories/:category_id/items/:id/edit(.:format)                      items#edit
#                    category_item GET      /categories/:category_id/items/:id(.:format)                           items#show
#                                  PATCH    /categories/:category_id/items/:id(.:format)                           items#update
#                                  PUT      /categories/:category_id/items/:id(.:format)                           items#update
#                                  DELETE   /categories/:category_id/items/:id(.:format)                           items#destroy
#                       categories GET      /categories(.:format)                                                  categories#index
#                                  POST     /categories(.:format)                                                  categories#create
#                     new_category GET      /categories/new(.:format)                                              categories#new
#                    edit_category GET      /categories/:id/edit(.:format)                                         categories#edit
#                         category GET      /categories/:id(.:format)                                              categories#show
#                                  PATCH    /categories/:id(.:format)                                              categories#update
#                                  PUT      /categories/:id(.:format)                                              categories#update
#                                  DELETE   /categories/:id(.:format)                                              categories#destroy
#      shopping_cart_item_add_item PATCH    /shopping_carts/:shopping_cart_id/items/:item_id/add_item(.:format)    items#add_item
#   shopping_cart_item_remove_item PATCH    /shopping_carts/:shopping_cart_id/items/:item_id/remove_item(.:format) items#remove_item
#              shopping_cart_items GET      /shopping_carts/:shopping_cart_id/items(.:format)                      items#index
#                                  POST     /shopping_carts/:shopping_cart_id/items(.:format)                      items#create
#           new_shopping_cart_item GET      /shopping_carts/:shopping_cart_id/items/new(.:format)                  items#new
#          edit_shopping_cart_item GET      /shopping_carts/:shopping_cart_id/items/:id/edit(.:format)             items#edit
#               shopping_cart_item GET      /shopping_carts/:shopping_cart_id/items/:id(.:format)                  items#show
#                                  PATCH    /shopping_carts/:shopping_cart_id/items/:id(.:format)                  items#update
#                                  PUT      /shopping_carts/:shopping_cart_id/items/:id(.:format)                  items#update
#                                  DELETE   /shopping_carts/:shopping_cart_id/items/:id(.:format)                  items#destroy
#                   shopping_carts GET      /shopping_carts(.:format)                                              shopping_carts#index
#                                  POST     /shopping_carts(.:format)                                              shopping_carts#create
#                new_shopping_cart GET      /shopping_carts/new(.:format)                                          shopping_carts#new
#               edit_shopping_cart GET      /shopping_carts/:id/edit(.:format)                                     shopping_carts#edit
#                    shopping_cart GET      /shopping_carts/:id(.:format)                                          shopping_carts#show
#                                  PATCH    /shopping_carts/:id(.:format)                                          shopping_carts#update
#                                  PUT      /shopping_carts/:id(.:format)                                          shopping_carts#update
#                                  DELETE   /shopping_carts/:id(.:format)                                          shopping_carts#destroy
#                             root GET      /                                                                      categories#index
# 

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
