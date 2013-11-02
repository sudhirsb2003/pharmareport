class CreateTabUsers < ActiveRecord::Migration
  def change
    create_table :tab_users do |t|
      t.string :name , :unique => true 
      t.text :address
      t.string :employee_uid , :unique => true , :nill => false

      t.timestamps
    end
  end
end
