class AddVideoToDoings < ActiveRecord::Migration
  def change
    add_column :doings, :video, :string
    add_column :doings, :video_type, :string
  end
end
