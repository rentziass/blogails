class AddNameToComment < ActiveRecord::Migration
  def change
    add_column :comments, :user_name, :string, index: true
  end
end
