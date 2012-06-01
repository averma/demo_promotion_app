TestApp::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  resources :promotions do
    get :autocomplete_promotion_name, :on => :collection
  end

  match '/businesses/new' => 'businesses#new', :as => :new_business, :method => :GET
  match '/businesses' => 'businesses#create', :as => :businesses, :method => :POST

  match '/products/new' => 'products#new', :as => :new_product, :method => :GET
  match '/products' => 'products#create', :as => :products, :method => :POST
  match '/get_product' => 'products#get_product', :as => :get_product, :method => :GET
  match '/show_products'=> 'promotions#show_products' , :as => :show_products, :method => :GET
  match '/edit_promotion' => 'promotions#edit_promotion', :as => :edit_promotion, :method => :POST
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
  root :to => 'promotions#new'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
