class CreateAdminArticles < ActiveRecord::Migration
  def change
    create_table :admin_articles do |t|
      t.string :name
      t.text :text

      t.timestamps null: false
    end
  end
end
