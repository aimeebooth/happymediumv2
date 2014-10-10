class AddTitleToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :title, :text
  end
end
