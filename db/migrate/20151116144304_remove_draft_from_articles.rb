class RemoveDraftFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :draft
  end
end
