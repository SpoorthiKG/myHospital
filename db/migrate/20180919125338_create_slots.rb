class CreateSlots < ActiveRecord::Migration
  def self.up
    create_table :slots do |t|
      t.time :slot_start_time
      t.time :slot_end_time
      t.date :slot_date
      t.references :doctor
      t.timestamps
    end
  end

  def self.down
    drop_table :slots
  end
end
