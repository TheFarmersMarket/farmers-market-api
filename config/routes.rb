Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations",
                                    sessions: "sessions",
                                    passwords: "passwords" } 
  resources :farmers, only: [:show, :destroy, :update, :edit] do
    get 'crops', to: 'farmers#crops'
    put 'pic', to: 'farmers#pic'
    get 'profile', to: 'farmers#profile'
  end
  resources :customers, :only => [:edit, :show, :update, :destroy] do
    put 'pic', to: 'customers#pic'
  end
  resources :crops, :only => [:create, :update, :destroy]
  get '/searches/search', to: 'searches#search', as: 'searches_search'
  post 'customers/:id/follow', to: 'customers#follow'
  put 'customers/:id/unfollow', to: 'customers#unfollow'
  get 'customers/:id/all_following', to: 'customers#all_following'
  get 'farmers/:id/follower_count', to: 'farmers#follower_count'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
