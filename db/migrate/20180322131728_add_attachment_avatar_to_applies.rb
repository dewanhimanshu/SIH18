class AddAttachmentAvatarToApplies < ActiveRecord::Migration[5.1]
  def self.up
    change_table :applies do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :applies, :avatar
  end
end
