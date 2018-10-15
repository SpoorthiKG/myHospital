class CreateDischargedPatients < ActiveRecord::Migration
  def self.up
    create_table :discharged_patients do |t|
      t.date :admitted_on
      t.date :discharged_on
      t.references :patient
      t.references :bed
      t.timestamps
    end
  end

  def self.down
    drop_table :discharged_patients
  end
end
