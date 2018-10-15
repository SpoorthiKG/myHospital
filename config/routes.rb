ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  map.resources :patients, :has_many => :appointments , :has_one => :patient_to_bed, :through => :doctor_suggested_patients ,:collection => { :change_password => :get,:view => :get , :department_list => :get, :previous_histroy => :get}
  map.resources :users , :collection => { :login => :get , :view => :get}
  map.resources :doctors , :has_many => :appointments, :has_many => :patients , :has_many => :slots, :collection => { :view => :get, :recommend_patient => :get,:change_password=>:get,:patients_being_treated => :get,:showing=>:get}
  map.resources :departments, :has_many => :doctors
  map.resources :slots , :has_one => :appointment, :has_one => :patient, :through => :appointment,  :collection => { :department_list => :get, :department_doctor_list => :get}
  map.resources :appointments ,:has_many => :medicalreports, :collection => {:no_slots => :get,:available_doctors => :get, :book_an_appointment => :get, :available_slots => :get, :appointments => :get}
  map.resources :rooms, :has_many => :beds , :collection =>{:export_csv_records=> :get}
  map.resources :beds,:has_many => :patient_to_beds, :has_many => :patients , :through => :patient_to_beds, :collection => {:adding_room => :get, :adding_bed => :get}
  map.resources :doctor_suggested_patients , :has_many => :patients , :has_many => :doctors
  map.resources :patient_to_beds  , :collection => {:available_beds=> :get}
  map.resources :discharged_patients
  map.resources :medicalreports, :has_many => :appointments,:has_one => :doctor , :has_one => :patient, :through=> :appointments, :collection => { :upload_file => :get,:record_view=>:get}
  map.logout '/logout', :controller => 'sessions',:action => 'destroy'
  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :productso

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
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.root :controller => "home"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
