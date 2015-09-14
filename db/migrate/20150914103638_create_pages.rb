class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :text
      t.boolean :visible

      t.timestamps null: false
    end
  end
end
