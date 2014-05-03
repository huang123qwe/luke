class CreateLamps < ActiveRecord::Migration
  def change
    create_table :lamps do |t|
      t.string :name
      t.string :position

      t.timestamps
    end

    add_attachment :lamps, :cover

  end
end
