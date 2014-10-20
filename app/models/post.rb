class Post < ActiveRecord::Base
  belongs_to :category

  # add default category for posts
  # scope :posts, -> { joins(:category).where.not(categories: {title: 'Page'}) }

  def category_title
    category.nil? ? "Uncategorized" : category.title  
  end

end
