class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :doctor, index: true
      t.references :medical_shop, index: true
      t.references :tab_user, index: true

      t.timestamps
    end
  end
end
