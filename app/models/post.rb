class Post < ActiveRecord::Base
  belongs_to :category

  def category_title
    category.title unless category.nil?
  end

end
