class Post < ActiveRecord::Base
  belongs_to :category

  scope :posts, -> { joins(:category).where.not(categories: {title: 'Page'}) }

  def category_title
    category.title unless category.nil?
  end

end
