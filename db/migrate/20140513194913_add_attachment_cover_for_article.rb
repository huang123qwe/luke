class AddAttachmentCoverForArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :cover
    add_attachment :articles, :cover
  end
end
