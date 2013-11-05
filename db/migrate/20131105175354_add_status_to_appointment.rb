class AddStatusToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :status, :string , default: "pending"
  end
end
