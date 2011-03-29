Agent::Application.routes.draw do
  resources :seller_properties
  get "users/new"

  get "users/edit"

  get "user_sessions/new"
  resources :user_sessions
  
  resources :users do
    resources :seller_properties
  end
   
  resources :home
  match '/user_profile' => "home#user_profile", :as => :user_profile
  match '/new_agent' => "users#create", :as => :new_agent
  match '/download' => "home#download"
  match '/login' => "user_sessions#new", :as => :login
  match '/logout' => "user_sessions#destroy", :as => :logout
  match '/new_buyer' => "users#new_buyer", :as => "new_buyer"
  match '/new_seller' => "users#new_seller", :as => "new_seller"
  match 'activate/:activation_code' => "users#activate", :as => :activate
  match '/upload_agreement' => "home#upload_agreement", :as => :upload_agreement
  match '/uncompleted' => "home#uncompleted", :as => :uncompleted
  match '/welcome' => "home#welcome", :as => :welcome

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
  # root :to => "welcome#index"
root :to => 'home#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
