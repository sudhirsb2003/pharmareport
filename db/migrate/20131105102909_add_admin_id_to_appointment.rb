class AddAdminIdToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :admin_id, :integer
  end
end
