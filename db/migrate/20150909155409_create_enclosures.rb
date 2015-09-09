class CreateEnclosures < ActiveRecord::Migration
  def change
    create_table :enclosures do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
