class AddAttachmentCoverForProduct < ActiveRecord::Migration
  def change
    remove_column :products, :cover
    add_attachment :products, :cover
  end
end
