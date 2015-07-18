class AddDateTimeToEventTime < ActiveRecord::Migration
  def change
    remove_column :event_times, :time, :string

    add_column :event_times, :display_time, :string
    add_column :event_times, :date_time, :datetime
  end
end
