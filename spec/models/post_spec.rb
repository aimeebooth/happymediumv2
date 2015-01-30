require 'spec_helper'

describe 'Post' do
  let(:post) { create(:post) }

  context '.posts' do
    let(:page_post) { create(:post, category: create(:category, title: 'Page')) }

    it 'returns a list of posts that are not pages' do
      Post.posts.should include(post)
      Post.posts.should_not include(page_post)
    end
  end

  context '.public_posts' do
    let(:archived_post) { create(:post, :archived) }
    let(:draft_post) { create(:post, :draft) }

    it 'returns a list of posts that are not archived' do
      Post.public_posts.should include(post)
      Post.public_posts.should_not include(archived_post)
      Post.public_posts.should_not include(draft_post)
    end
  end

  context '#category_title' do
    context 'with a category title' do
      it 'returns the title' do
        post.category_title.should eq(post.category.title)
      end 
    end

    context 'without a category title' do
      let(:post) { create(:post, :uncategorized) }

      it 'returns "uncategorized"' do
        post.category_title.should eq("Uncategorized")
      end
    end
  end

  context '#related_posts' do
    let(:wellness) { create(:category, title: 'Wellness') }
    let(:post) { create(:post, category: wellness) }
    let(:related_post) { create(:post, category: wellness) }

    it 'returns a list of related posts' do
      post.related_posts.should include(related_post)
    end
  end

end