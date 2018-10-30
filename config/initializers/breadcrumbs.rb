Gretel::Crumbs.layout do
  
  crumb :root do
   link "Home", {:controller => "users", :action => "view"}
  end
  
  #crumb :users_view do
   #link "View" ,{ :controller => "users" , :action => "view"}
 #end
  
  crumb :departments_index do
    link "Departments", {:controller => "departments", :action => "index"}
    parent  :root
  end
  crumb :departments_edit do
    link "Edit Department",{:controller => "departments", :action => "edit"}
    parent :departments_index
  end
  crumb :departments_update do
    link "Departments", {:controller => "departments", :action => "update"}
    parent  :root
  end
  
  crumb :departments_new do
    link "New Department",{:controller => "departments", :action => "new"}
    parent :departments_index
  end
  
  crumb :departments_create do
    link "New Department",{:controller => "departments", :action => "new"}
    parent :departments_index
  end
  
  crumb :doctors_index do
    link " Doctors",{:controller => "doctors", :action => "index"}
    parent :departments_index
  end
  crumb :doctor_suggested_patients_edit do
    link "Edit Details", {:controller => :doctor_suggested_patients, :action =>"edit"}
    parent :doctor_suggested_patients_index
  end
  crumb :rooms_edit do
    link "Edit Room", {:controller => "rooms" , :action => "edit"}
    parent :rooms_index
  end
  crumb :doctors_new do
    link "New Doctor",{:controller => "doctors", :action => "new"}
     parent :departments_index
  end
  crumb :medicalreports_index do
    link "Records", {:controller => "medicalreports", :action =>"index"}
    parent :root
  end
   crumb :medicalreports_new do
    link "Records", {:controller => "medicalreports", :action =>"new"}
    parent :root
  end
  crumb :doctors_show do
    link "Profile" , {:controller => "doctors", :action => "show"}
    parent :departments_index
  end 
  
  crumb :users_patient_selection do
    link "Previous Histroy", {:controller => "users",:action => "patient_selection"}
    parent :root
  end
  crumb :appointments_index do
    link "Appointments", {:controller => "appointments",:action =>"index"}
    parent :root
  end
  crumb :slots_new do
    link "Slot",{:controller => "slots", :action => "new"}
    parent :root
  end
 crumb :slots_total_slots do
    link "Present Slot",{:controller => "slots", :action => "total_slots"}
    parent :slots_index
  end
  crumb :slots_index do
    link "Slots creation", {:controller => "slots", :action=>"index"}
    parent :root
  end
   crumb :slots_new do
    link "Slot",{:controller => "slots", :action => "new"}
    parent :slots_index
  end
  crumb :slots_create do
    link "Slot",{:controller => "slots", :action => "create"}
    parent :slots_index
  end
  crumb :doctor_suggested_patients_index do
    link "Allot Bed", {:controller => "doctor_suggested_patients", :action=> "index"}
    parent :root
  end
  crumb :patient_to_beds_new do
  link "New" , {:controller => "patient_to_bed", :action => "new"}
  parent :doctor_suggested_patients_index
  end
  crumb :rooms_index do
    link "Rooms", {:controller=> "rooms", :action => "index"}
    parent :root
  end
  crumb :rooms_new do
    link "New Room", {:controller=>"rooms",:action=>"new"}
    parent :rooms_index
  end
  crumb :rooms_edit do
    link "New Room", {:controller=>"rooms",:action=>"edit"}
    parent :rooms_index
  end
  crumb :rooms_update do
    link "New Room", {:controller=>"rooms",:action=>"update"}
    parent :rooms_index
  end
  crumb :rooms_create do
    link "New Room", {:controller=>"rooms",:action=>"new"}
    parent :rooms_index
  end
  crumb :beds_adding_room do
    link "New Bed", {:controller=>"beds", :action =>"adding_room"}
    parent :root
  end
  crumb :patient_to_beds_index do
    link "Admitted Patient", {:controller =>"patient_to_beds",:action=>"index"}
    parent :root
  end
  crumb :beds_index do
    link "Bed", {:controller=> "beds",:action=>"index"}
    parent :beds_adding_room
  end
 
  crumb :medicalreports_record_view do
    link "View Records", {:controller=>"medicalreports",:action=>"recor_view"}
    parent :root
  end
  crumb :appointments_book_an_appointment do
    link "Appointments", {:controller=>"appointments",:action=>"book_an_appointment"}
    parent :root
  end
  crumb :patients_change_password do
    link "Reset Password", {:controller=>"patients",:action=>"change_password"}
    parent :root
  end
  crumb :patients_previous_histroy do
    link "Previous Visits", {:controller=>"patients",:action=>"previous_patients"}
    parent :root
  end
  crumb :medicalreports_new do
    link "Upload Records", {:controller=>"medicalreports",:action=>"new"}
    parent :root
  end
  crumb :medicalreports_create do
    link "Upload Records", {:controller=>"medicalreports",:action=>"new"}
    parent :root
  end
  crumb :appointments_appointments do
    link "Appointments", {:controller=>"appointments",:action=>"appointments"}
    parent :root
  end
  crumb :doctors_recommend_patient do
    link "Recommend Patient", {:controller=>"doctors",:action=>"recommend_patients"}
    parent :root
  end
  
  crumb :doctors_patients_being_treated do
    link "Patients being Treated", {:controller => "doctors", :action => "patients_being_treated"}
    parent :root
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
    parent :root
  end
   crumb :appointments_book_an_appointment do
    link "Appointments", {:controller=>"appointments",:action=>"book_an_appointment"}
    parent :root
  end
 
  crumb :doctors_view do
    link "View", {:controller=> "doctors", :action => "view"}
    parent :root
  end
  
end