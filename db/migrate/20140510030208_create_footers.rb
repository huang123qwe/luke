class CreateFooters < ActiveRecord::Migration
  def change
    create_table :footers do |t|
      t.string :name
      t.string :title
      t.text :content
    end
  end
end
