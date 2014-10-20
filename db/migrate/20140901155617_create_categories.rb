class CreateCategories < ActiveRecord::Migration
  def change
    unless table_exists? :categories
      create_table :categories do |t|

        t.timestamps
      end
    end
  end
end
