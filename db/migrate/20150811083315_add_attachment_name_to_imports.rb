class AddAttachmentNameToImports < ActiveRecord::Migration
  def self.up
    change_table :imports do |t|
      t.attachment :name
    end
  end

  def self.down
    remove_attachment :imports, :name
  end
end
