class AddDraftToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :draft, :boolean, default: false
  end
end
