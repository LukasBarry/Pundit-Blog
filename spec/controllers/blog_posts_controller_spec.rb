require 'rails_helper'

RSpec.describe BlogPostsController do

  context 'when user is signed in' do
    let(:user) {create(:user)}
    before do
      sign_in(user)
    end

    describe 'GET #new' do
      it 'have http success' do
        get :new
        expect(response).to have_http_status(:success)
      end
      it 'assigns @blog_post to BlogPost' do
        get :new
        expect(assigns(:blog_post)).to be_a_new(BlogPost)
      end
    end

    describe 'GET #edit' do
      let(:blog_post) {create(:blog_post, user: user)}
      it 'have http success' do
        get :edit, id: blog_post
        expect(response).to have_http_status(:success)
      end
      it 'assigns requested BlogPost to @blog_post' do
        get :edit, id: blog_post
        expect(assigns(:blog_post)).to eq(blog_post)
      end
    end

    describe 'POST #create' do
      let(:invalid_attributes) { attributes_for(:blog_post).merge(blog_entry: '') }
      it 'creates a new blog post' do
        expect {
          post :create, blog_post: attributes_for(:blog_post)
        }.to change(BlogPost, :count).by(1)
        expect(response).to redirect_to(blog_post_path(assigns[:blog_post]))
      end
      it 'fails and renders new' do
        post :create, blog_post: invalid_attributes
        expect(response).to render_template(:new)
      end
    end

    describe 'GET #show' do
      let(:blog_post) {create(:blog_post, user: user)}
      it 'have http success' do
        get :show, id: blog_post
        expect(response).to have_http_status(:success)
      end
      it 'assigns requested BlogPost to @blog_post' do
        get :show, id: blog_post
        expect(assigns(:blog_post)).to eq(blog_post)
      end
    end

    describe 'GET #index' do
      it 'have http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #your_posts' do
      it 'have http success' do
        get :user_posts, id: user
        expect(response).to have_http_status(:success)
      end
    end

    describe 'PUT #update' do
      let(:blog_post) { create(:blog_post) }
      let(:blog_post_params_hash) {
           attributes_for(:blog_post, title: '6 Title for Post')
      }
      it 'updates the attributes' do
        put :update, id: blog_post,
                     blog_post: blog_post_params_hash
        blog_post.reload
        expect(blog_post.title).to eql('7 Title for Post')
      end
      it 'redirects to show' do
        put :update, id: blog_post
        expect(assigns(:blog_post)).to eq(blog_post)
      end
    end

    describe 'DELETE #destroy' do
      let(:blog_post) { create(:blog_post) }
      it 'deletes a blog post and redirects to index' do
        delete :destroy, id: blog_post
        expect(response).to redirect_to(blog_posts_path)
      end
    end
  end
end
