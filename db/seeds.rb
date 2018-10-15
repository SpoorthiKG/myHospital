# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first
admin = User.new()
admin.first_name = "Admin"
admin.middle_name = "User"
admin.last_name = "System"
admin.date_of_birth = "12-02-1997"
admin.address ="banglore"
admin.contact_number = "8792099635"
admin.email ="spoorthi0811@gmail.com"
admin.user_determin_type = "admin"
admin.encrypted_password = Digest::SHA1.hexdigest("admin123")
admin.gender="F"
admin.is_admin = 1
admin.save