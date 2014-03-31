class AddPositionToDoings < ActiveRecord::Migration
  def change
    add_column :doings, :position, :string
  end
end
