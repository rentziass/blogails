class AddDraftToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :draft, :integer
  end
end
