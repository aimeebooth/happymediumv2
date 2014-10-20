class CreateTags < ActiveRecord::Migration
  def change
    unless table_exists? :tags
      create_table :tags do |t|
        t.integer :post_id
        t.timestamps
      end
    end
  end
end
