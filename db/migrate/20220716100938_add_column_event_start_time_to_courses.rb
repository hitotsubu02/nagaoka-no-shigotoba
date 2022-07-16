class AddColumnEventStartTimeToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :event_start_time, :time
  end
end
