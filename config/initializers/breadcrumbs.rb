Gretel::Crumbs.layout do
  
  crumb :root do
    link "Home", {:controller => "user" , :action => "view"}
  end
  
  crumb :users_view do
    link "View" ,{ :controller => "users" , :action => "view"}
  end
  
  crumb :departments_index do
    link "Departments", {:controller => "departments", :action => "index"}
    parent  :users_view
  end
  
  crumb :departments_new do
    link "New Department",{:controller => "departments", :action => "new"}
    parent :departments_index
  end
  
  crumb :doctors_index do
    link " Doctors",{:controller => "doctors", :action => "index"}
    parent :departments_index
  end
  
  crumb :doctors_new do
    link "New Doctor",{:controller => "doctors", :action => "new"}
     parent :departments_index
  end
  
  crumb :doctors_show do
    link "Profile" , {:controller => "doctors", :action => "show"}
    parent :departments_index
  end 
  
  crumb :slots_new do
    link "Slot",{:controller => "slots", :action => "new"}
    parent :doctors_index
  end
 
  crumb :slots_index do
    link "Slots creation", {:controller => "slots", :action=>"index"}
    parent :users_view
  end
   crumb :slots_new do
    link "Slot",{:controller => "slots", :action => "new"}
    parent :slots_index
  end
  crumb :doctor_suggested_patients_index do
    link "Allot Bed", {:controller => "doctor_suggested_patients", :action=> "index"}
    parent :users_view
  end
  crumb :patient_to_beds_new do
  link "New" , {:controller => "patient_to_bed", :action => "new"}
  parent :doctor_suggested_patients_index
  end
  crumb :rooms_index do
    link "Rooms", {:controller=> "rooms", :action => "index"}
    parent :users_view
  end
  crumb :rooms_new do
    link "New Room", {:controller=>"rooms",:action=>"new"}
    parent :rooms_index
  end
  crumb :beds_adding_room do
    link "New Bed", {:controller=>"beds", :action =>"adding_room"}
    parent :users_view
  end
  crumb :patient_to_beds_index do
    link "Admitted Patient", {:controller =>"patient_to_beds",:action=>"index"}
    parent :users_view
  end
  crumb :patients_view do
    link "View", {:controller=>"patients",:action=>"view"}
  end
  crumb :medicalreports_record_view do
    link "View Records", {:controller=>"medicalreports",:action=>"recor_view"}
    parent :patients_view
  end
  crumb :appointments_book_an_appointment do
    link "Appointments", {:controller=>"appointments",:action=>"book_an_appointment"}
    parent :patients_view
  end
  crumb :patients_change_password do
    link "Reset Password", {:controller=>"patients",:action=>"change_password"}
    parent :patients_view
  end
  crumb :patients_previous_histroy do
    link "Previous Visits", {:controller=>"patients",:action=>"previous_patients"}
    parent :patients_view
  end
  crumb :doctors_view do
    link "View", {:controller=>"doctors",:action=>"view"}
  end
  crumb :medicalreports_new do
    link "Upload Records", {:controller=>"medicalreports",:action=>"new"}
    parent :doctors_view
  end
  crumb :appointments_appointments do
    link "Appointments", {:controller=>"appointments",:action=>"appointments"}
    parent :doctors_view
  end
  crumb :doctors_recommend_patient do
    link "Recommend Patient", {:controller=>"doctors",:action=>"recommend_patients"}
    parent :doctors_view
  end
  
  crumb :doctors_patients_being_treated do
    link "Patients being Treated", {:controller => "doctors", :action => "patients_being_treated"}
    parent :doctors_view
  end
  crumb :appointments_show do
    link "Profile" , {:controller => "appointments", :action => "show"}
    parent :doctors_patients_being_treated
  end
  crumb :doctors_create do
    link "New Doctor", {:controller=> 'doctor', :action => "create"}
    parent :departments_index
  end
  crumb :doctors_change_password do
    link "Change Password", {:controller=>'doctor', :action => 'change_password'}
    parent :doctors_view
  end
   crumb :appointments_book_an_appointment do
    link "Appointments", {:controller=>"appointments",:action=>"book_an_appointment"}
    parent :users_view
  end
end