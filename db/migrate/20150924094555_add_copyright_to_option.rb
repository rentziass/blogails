class AddCopyrightToOption < ActiveRecord::Migration
  def change
    add_column :options, :copyright, :string
  end
end
