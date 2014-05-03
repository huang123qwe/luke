class AddCoverForDoing < ActiveRecord::Migration
  def change
    remove_column :doings, :cover
    add_attachment :doings, :cover
  end
end
