class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :content
      t.string :cover
      t.string :country
      t.string :city
      t.timestamps
    end
  end
end
