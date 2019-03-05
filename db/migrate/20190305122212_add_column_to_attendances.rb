class AddColumnToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :recorded_on, :date
  end
end
