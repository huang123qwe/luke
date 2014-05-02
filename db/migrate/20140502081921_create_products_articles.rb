class CreateProductsArticles < ActiveRecord::Migration
  def change
    create_table :products_articles do |t|
      t.integer :product_id
      t.integer :article_id
    end
  end
end
