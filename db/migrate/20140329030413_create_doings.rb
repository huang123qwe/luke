class CreateDoings < ActiveRecord::Migration
  def change
    create_table :doings do |t|
      t.string :name
      t.string :cover
      t.string :src
      t.string :video
      t.string :video_type
      t.string :position
      t.timestamps
    end
  end
end
