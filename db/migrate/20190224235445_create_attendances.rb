class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :user, foreign_key: true
      t.timestamp :attend_time
      t.timestamp :leave_time
      t.integer :work_time
      t.string :remarks

      t.timestamps
    end
  end
end
