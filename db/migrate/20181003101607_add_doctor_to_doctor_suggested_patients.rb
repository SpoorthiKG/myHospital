class AddDoctorToDoctorSuggestedPatients < ActiveRecord::Migration
  def self.up
    add_column :doctor_suggested_patients,  :doctor_id , :integer
  end

  def self.down
    remove_column :doctor_suggested_patients, :doctor_id , :integer
  end
end
