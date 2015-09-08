class AddImageToCategory < ActiveRecord::Migration
  def up
    add_attachment :admin_categories, :image
  end

  def down
    remove_attachmente :admin_categories, :image
  end
end
