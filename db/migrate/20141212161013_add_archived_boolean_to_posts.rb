class AddArchivedBooleanToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :archived, :boolean, null: false, default: false
  end
end
