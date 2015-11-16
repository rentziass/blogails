class RenameUserInAuthorForArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :user_id
    add_column :articles, :author_id, :integer, index: true
  end

  def down
    remove_column :articles, :author_id
    add_column :articles, :user_id, :integer, index: true
  end
end
