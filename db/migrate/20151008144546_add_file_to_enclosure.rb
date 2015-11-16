class AddFileToEnclosure < ActiveRecord::Migration
  def up
    add_attachment :enclosures, :file
  end

  def down
    remove_attachment :enclosures, :file
  end
end
