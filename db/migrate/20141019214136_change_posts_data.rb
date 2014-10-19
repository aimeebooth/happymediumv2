class ChangePostsData < ActiveRecord::Migration
  def change
    remove_column :posts, :name

    # rename_column :table, :old_column, :new_column
    rename_column :posts, :content, :body
  end
end
