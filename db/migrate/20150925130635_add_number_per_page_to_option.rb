class AddNumberPerPageToOption < ActiveRecord::Migration
  def change
    add_column :options, :number_per_page, :integer
  end
end
