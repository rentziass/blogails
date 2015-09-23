class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :title
      t.string :subtitle
      t.text :footer
      t.text :analitics

      t.timestamps null: false
    end
  end
end
