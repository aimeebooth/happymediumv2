class RemoveTags < ActiveRecord::Migration
  def up
    drop_table :tags
  end

  def down
    create_table :tags do |t|
      t.integer :post_id
      t.timestamps
    end
  end
end
