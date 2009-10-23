ActionController::Routing::Routes.draw do |map|
  map.resources :links

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
#  map.register '/register', :controller => 'users', :action => 'create'
#map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session

  map.resources :staffs
 # map.staff 'staff', :controller => 'staffs', :action => 'index'

  map.resources :brands

  map.resources :banners

  map.resources :visitors
  map.visitors 'visitors', :controller => 'visitors', :action => 'index'

  map.resources :pages

  map.resources :products
  
  
map.resources :categories
  
  map.resources :categories do |category| 
       category.resources :brands do |brand| 
            brand.resources :products  
       end 
  end

  
  map.find_banner 'find_banner', :controller => 'banners', :action => 'find_banner'
  map.contact 'contact', :controller => 'contact', :action => 'index'
  map.wish_list 'wish_list', :controller => 'wish_list', :action => 'index'

  
  map.with_options :controller => 'static' do |static|
    static.home 'home', :action => 'home'
    static.about 'about', :action => 'about'
    static.history 'history', :action => 'history'
    static.shop_info 'shop_info', :action => 'shop_info'
    static.repairs 'repairs', :action => 'repairs'
    static.admin 'admin', :action => 'admin'
  end
 
 #This would be for hard links but the url_name creates this for us. 
  #map.acoustic_categories '/categories/acoustic-guitars', :controller => 'categories', :action => 'show', :id => 'acoustic-guitars'
 
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "static", :action => "home"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
