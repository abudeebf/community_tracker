class AddAttachmentPhotoToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :groups, :photo
  end
end
