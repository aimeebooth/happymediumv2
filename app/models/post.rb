class Post < ActiveRecord::Base
  belongs_to :category

  scope :posts, -> { joins(:category).where.not(categories: {title: 'Page'}) }

  def category_title
    category.nil? ? "Uncategorized" : category.title  
  end

  def related_posts
    Post.where("id != ?", id).where(category_id: category_id).order('random()').limit(3) 
  end
end
