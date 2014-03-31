class CreateDoings < ActiveRecord::Migration
  def change
    create_table :doings do |t|
      t.string :name
      t.string :cover
      
      t.timestamps
    end
  end
end
