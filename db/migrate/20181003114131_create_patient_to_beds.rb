class CreatePatientToBeds < ActiveRecord::Migration
  def self.up
    create_table :patient_to_beds do |t|
      t.date :admitted_on
      t.boolean :vacated
      t.references :patient
      t.references :bed
      t.timestamps
    end
  end

  def self.down
    drop_table :patient_to_beds
  end
end
