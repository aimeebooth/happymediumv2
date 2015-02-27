class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :category

  scope :posts, -> { joins(:category).where.not(categories: {title: 'Page'}) }
  scope :public_posts, -> { posts.where(archived: false).where(draft: false) }

  def category_title
    category.nil? ? "Uncategorized" : category.title  
  end

  def related_posts
    Post.where("id != ?", id).where(category_id: category_id).order('random()').limit(3) 
  end

end
