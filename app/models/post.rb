class Post < ActiveRecord::Base
  belongs_to :category

  scope :posts, -> { unarchived.joins(:category).where.not(categories: {title: 'Page'}) }
  scope :unarchived, -> { where(archived: false) }

  def category_title
    category.nil? ? "Uncategorized" : category.title  
  end

  def related_posts
    Post.where("id != ?", id).where(category_id: category_id).order('random()').limit(3) 
  end

  def archive!
    self.archived = true
    self.save!
  end
end
