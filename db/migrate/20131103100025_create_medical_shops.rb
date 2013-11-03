class CreateMedicalShops < ActiveRecord::Migration
  def change
    create_table :medical_shops do |t|
      t.string :shop_name
      t.text :shop_address

      t.timestamps
    end
  end
end
