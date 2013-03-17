Vivento::Application.routes.draw do

  root to: 'sessions#new'
  match '/', to: 'sessions#new'

  resources :addresses
  resources :apartments
  resources :buildings
  resources :condos
  resources :messages
  resources :people
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :communications

  match '/sign_up',           to: 'users#sign_up'
  match '/sign_up_facebook',  to: 'users#sign_up_with_facebook'
  match '/sign_up_vivento',   to: 'users#sign_up_with_vivento'
  match '/sign_in',           to: 'sessions#new'
  match '/sign_in_facebook',  to: 'sessions#sign_in_with_facebook'
  match '/sign_in_vivento',  to: 'sessions#sign_in_with_vivento'
  match '/sign_out',          to: 'sessions#destroy', via: :delete

  match '/me',                to: 'people#me'
  match '/profile/:id',       to: 'people#show'
  match '/profile/:id/:name', to: 'people#show'
  match '/profiles',          to: 'people#index'

  match '/address/cep/:number', to: 'addresses#cep', via: [:get]


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
