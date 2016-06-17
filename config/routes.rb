Rails.application.routes.draw do

  # get '/lists' => 'lists#index'
  # get '/lists/new' => 'lists#new'
  # post '/lists' => 'lists#create'
  # get '/lists/:id' => 'lists#show', as: :list
  # get '/lists/:id/edit' => 'lists#edit', as: :edit_list
  # put '/lists/:id' => 'lists#update'
  # patch '/lists/:id' => 'lists#update'
  # delete '/lists/:id' => 'lists#destroy', as: :delete_list

  resources :lists do
    resources :items, except: :index
  end

  root 'lists#index' # ListsController

  # constraints is a keyword parameter that accepts a lambda that will evaluat whether or not a request can be made to this namespace
  namespace :api, constraints: lambda { |req| req.format == :json } do
    namespace :v1 do
      resources :lists, except: [:new, :edit]
    end
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
