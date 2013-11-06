class AddAttachmentPhotoToReports < ActiveRecord::Migration
  def self.up
    change_table :reports do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :reports, :photo
  end
end
