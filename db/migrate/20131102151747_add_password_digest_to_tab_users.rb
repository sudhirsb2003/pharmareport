class AddPasswordDigestToTabUsers < ActiveRecord::Migration
  def change
    add_column :tab_users, :password_digest, :string
    add_column :tab_users, :admin, :boolean ,default: false
  end
end
