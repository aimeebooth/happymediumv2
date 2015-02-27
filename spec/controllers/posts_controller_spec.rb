require 'rails_helper'

describe PostsController do
  let(:category) { create(:category) }
  let(:post) { create(:post, category: category, created_at: 1.day.ago) }
  let(:post2) { create(:post, category: create(:category)) }

  context 'index' do

    it 'is successful' do
      get :index
      expect(response.status).to eq(200)
    end
    
    it 'displays a list of posts in order created_at desc' do
      get :index
      expect(assigns(:posts)).to eq([post2, post])
    end

  end

  context 'show' do

    context 'with an unarchived post' do

      it 'is successful' do
        get :show, id: post.id
        expect(response.status).to eq(200)
      end

      it 'displays a post' do
        get :show, id: post.id
        expect(assigns(:post)).to eq(post)
      end

      context 'related_posts' do

        let(:related_post) { create(:post, category: category) }

        it 'displays a list of related posts' do
          get :show, id: post.id
          expect(assigns(:related_posts)).to include(related_post)
          expect(assigns(:related_posts)).to_not include(post2)
        end

      end

    end

    context 'with an archived post' do
      let(:post) { create(:post, :archived) }

      context 'without an admin' do

        before do
          ApplicationController.any_instance.stub(:is_admin?).and_return(false)
        end

        it 'redirects the user to the index' do
          get :show, id: post.id
          expect(response.status).to eq(302)
        end

      end

      context 'with an admin' do

        before do
          ApplicationController.any_instance.stub(:is_admin?).and_return(true)
        end

        it 'redirects the user to the index' do
          get :show, id: post.id
          expect(response.status).to eq(200)
        end

      end

    end
   
  end
end