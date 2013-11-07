class AddAppointmentIdToReport < ActiveRecord::Migration
  def change
    add_column :reports, :appointment_id, :integer
  end
end
