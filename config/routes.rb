Rails.application.routes.draw do
  get '/reporting', to: 'reporting#index', as: 'reporting'

  get 'books/index'

  # get 'book/index'
  resources :books
  resources :authors
  resources :classifications
  resources :genres
  resources :ratings
  resources :lists
  resources :list_books
  resources :libraries
  resources :locations
  resources :book_locations
  resources :library_items

  get 'settings/fields', to: 'settings#fields', as: 'fields'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get '/bookshelf', to: 'books#bookshelf', as: 'bookshelf'

  # You can have the root of your site routed with "root"
  root 'home#index'
  # Because apache/passenger is messing up the root route for some reason
  get '/home', to: 'home#index', as: 'home'

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
