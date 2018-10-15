class CreateMedicalreports < ActiveRecord::Migration
  def self.up
    create_table :medicalreports do |t|
      t.references :patient
      t.references :doctor
      t.timestamps
    end
  end

  def self.down
    drop_table :medicalreports
  end
end
