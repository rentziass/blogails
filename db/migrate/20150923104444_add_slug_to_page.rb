class AddSlugToPage < ActiveRecord::Migration
  def change
    add_column :pages, :slug, :string, index: true, unique: true
  end
end
