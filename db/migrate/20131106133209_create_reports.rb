class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :tab_user_id
      t.integer :doctor_id
      t.integer :medical_shop_id
      t.boolean :product_shown
      t.boolean :sample_given
      t.integer :product_copy
      t.boolean :doctor_have_stock
      t.boolean :product_offer
      t.string :offer_name
      t.text :offer_detail
      t.boolean :browsher_shown
      t.text :doctors_comment

      t.timestamps
    end
  end
end
