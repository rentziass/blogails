class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.boolean :evidence
      t.boolean :visible
      t.datetime :date
      t.boolean :commentable

      t.timestamps null: false
    end
  end
end
