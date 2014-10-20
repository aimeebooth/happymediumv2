class AddTitleToCategory < ActiveRecord::Migration
  def change
    unless column_exists? :categories, :title
      add_column :categories, :title, :text
    end
  end
end
