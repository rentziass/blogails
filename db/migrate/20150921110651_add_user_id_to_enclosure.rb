class AddUserIdToEnclosure < ActiveRecord::Migration
  def change
    add_column :enclosures, :user_id, :integer
  end
end
