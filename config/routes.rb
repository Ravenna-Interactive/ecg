ActionController::Routing::Routes.draw do |map|
  map.resources :brands

  map.resources :banners

  map.resources :visitors

  map.resources :pages

  map.resources :products
  
  
map.resources :categories
  
  map.resources :categories do |category| 
       category.resources :brands do |brand| 
            brand.resources :products  
       end 
  end

  
  map.find_banner 'find_banner', :controller => 'banners', :action => 'find_banner'

  
  map.with_options :controller => 'products', :action => 'products' do |product|
    product.acoustics '/acoustics',     :id => 'acoustics'
     product.electrics '/electrics',     :id => 'electrics'
     product.bass      '/bass',          :id => 'bass'
     product.amps      '/amps',          :id => 'amps'
     product.effects   '/effects-other', :id => 'effects-other'
    end
  
  map.with_options :controller => 'static' do |static|
    static.home 'home', :action => 'home'
    static.about 'about', :action => 'about'
    static.links 'links', :action => 'links'
    static.privacy 'privacy', :action => 'privacy'
  end
  
  
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
