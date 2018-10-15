class CreateDoctorSuggestedPatients < ActiveRecord::Migration
  def self.up
    create_table :doctor_suggested_patients do |t|
      t.boolean :to_be_admitted
      t.references :doctor
      t.references :patient
      t.timestamps
    end
  end

  def self.down
    drop_table :doctor_suggested_patients
  end
end
