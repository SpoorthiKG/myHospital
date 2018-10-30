authorization do
  
  role :admin do
    has_permission_on [:patients], :to => [:new, :create,:destroy,:index] 
    has_permission_on [:doctors], :to =>[:create,:new,:index,:destroy, :show,:edit] 
    has_permission_on [:rooms], :to => [:create, :new, :index, :destroy, :edit,:export_csv_records]
    has_permission_on [:beds] , :to => [:create,:new, :index, :show, :adding_room,:adding_bed,:listing_beds,:destroy,:new_bed]
    has_permission_on [:appointments], :to => [:new, :create,  :book_an_appointment, :available_slots, :available_doctors,:index,:adding_appointment] 
    has_permission_on [:slots], :to => [:create,:new, :index, :show,:total_slots,:destroy]
    has_permission_on [:departments], :to => [:create,:new, :index, :show,:edit,:destroy]
    has_permission_on [:patient_to_beds], :to => [:create,:new, :index, :show,:available_beds,:destroy]
    has_permission_on [:doctor_suggested_patients] ,:to => [:create,:new, :index, :show, :edit]
    has_permission_on [:medicalreports]  , :to => [:create,:new,:index,:adding_report]
    has_permission_on [:users], :to => [:view, :index,:patient_selection]
  end
  
 role :Patient do
   has_permission_on [:medicalreports] , :to => [:record_view] 
   has_permission_on [:appointments] , :to => [:destroy, :available_doctors, :book_an_appointment, :available_slots, :create,:new]
   has_permission_on [:patients] , :to => [:previous_histroy, :change_password,:reset]
   has_permission_on [:users], :to => [:view]
 end
 
 role :Doctor do
   has_permission_on [:medicalreports] , :to => [:upload_file,:new,:create, :update]
   has_permission_on [:appointments] , :to => [ :show, :appointments]
   has_permission_on [:doctors] , :to => [:recommend_patient, :patients_being_treated, :change_password, :reset]
   has_permission_on [:patients] , :to =>[:show]
 end
 
end

