class AddImageToArticleImage < ActiveRecord::Migration
  def up
    add_attachment :article_images, :image
  end

  def down
    remove_attachment :article_images, :image
  end
end
