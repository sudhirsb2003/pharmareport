class AddPhotoToTabUser < ActiveRecord::Migration
  def change
  	add_attachment :tab_users, :photo
  end
end
