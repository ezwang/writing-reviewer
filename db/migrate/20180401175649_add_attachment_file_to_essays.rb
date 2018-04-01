class AddAttachmentFileToEssays < ActiveRecord::Migration[5.1]
  def self.up
    change_table :essays do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :essays, :file
  end
end
