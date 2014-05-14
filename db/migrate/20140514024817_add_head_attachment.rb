class AddHeadAttachment < ActiveRecord::Migration
  def change
    add_attachment :products, :top_cover
    add_attachment :articles, :top_cover
  end
end
