class AddRoleNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, index: true
  end
end
