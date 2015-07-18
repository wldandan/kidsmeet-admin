class CreateEventTimes < ActiveRecord::Migration
  def change
    create_table :event_times do |t|
      t.string :time
      t.integer :number_limit
      t.integer :event_id
      t.timestamps
    end
  end
end
