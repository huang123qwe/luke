class AddSrcForDoing < ActiveRecord::Migration
  def change
    add_column :doings, :src, :string
  end
end
