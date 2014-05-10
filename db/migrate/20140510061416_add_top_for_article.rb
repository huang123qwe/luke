class AddTopForArticle < ActiveRecord::Migration
  def change
    add_column :articles, :top, :boolean
    add_column :articles, :top_at, :time

    add_column :products, :top, :boolean
    add_column :products, :top_at, :time
  end
end
