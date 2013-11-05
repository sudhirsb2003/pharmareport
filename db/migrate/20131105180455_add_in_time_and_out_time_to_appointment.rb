class AddInTimeAndOutTimeToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :in_time, :datetime
    add_column :appointments, :out_time, :datetime
  end
end
