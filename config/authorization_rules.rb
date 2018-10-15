authorization do
  
  role :admin do
    has_permission_on [:patients], :to => [:new, :create,:delete,:index,:previous_histroy] 
    has_permission_on [:doctors], :to =>[:create,:new,:index,:delete,:recommend_patient, :show] 
    has_permission_on [:rooms], :to => [:create, :new, :index, :delete]
    has_permission_on [:beds] , :to => [:create,:new, :index, :show, :adding_room]
    has_permission_on [:appointments], :to => [:new, :create,  :book_an_appointment, :available_slots, :available_doctors] 
    has_permission_on [:slots], :to => [:create,:new, :index, :show]
    has_permission_on [:departments], :to => [:create,:new, :index, :show]
    has_permission_on [:patient_to_beds], :to => [:create,:new, :index, :show]
    has_permission_on [:doctor_suggested_patients] ,:to => [:create,:new, :index, :show]
  has_permission_on [:medicalreports]  , :to => [:create,:new, :record_view,:upload_file]
  end
  
 role :patient do
   has_permission_on [:medicalreports] , :to => [:record_view] 
   has_permission_on [:appointments] , :to => [:delete, :available_doctors, :book_an_appointment, :available_slots,:index, :show,:create,:new]
   has_permission_on [:patients] , :to => [:previous_histroy, :change_password,:reset]
 end
 
 role :doctor do
   has_permission_on [:medicalreports] , :to => [:upload_file,:new,:create, :update]
   has_permission_on [:appointments] , :to => [:index, :show, :appointments]
   has_permission_on [:doctors] , :to => [:recommend_patient , :patients_being_treated, :change_password, :reset]
   has_permission_on [:patients] , :to =>[:show]
 end
 
end

