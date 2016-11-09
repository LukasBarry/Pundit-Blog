require 'rails_helper'

RSpec.describe CommentsController do

  context 'when user is signed in' do
    let(:user) { create(:user) }
    before do
      sign_in(user)
    end

    describe 'GET #edit' do
      let(:comment) { create(:comment, user: user) }
      before { get :edit, id: comment, blog_post_id: comment.blog_post }
      it 'have http success' do
        expect(response).to have_http_status(:success)
      end
      it 'assigns requested Comment to @comment' do
        expect(assigns(:comment)).to eq(comment)
      end
    end

    describe 'POST #create' do
      let(:blog_post) { create(:blog_post) }
      let(:valid_attributes) { attributes_for(:comment) }
      let(:invalid_attributes) { valid_attributes.merge(comment_entry: '') }
      it 'creates a new comment' do
        expect {
          post :create,
          blog_post_id: blog_post,
          comment: valid_attributes
        }.to change(Comment, :count).by(1)
      end
      it 'redirects to the blog post' do
        post :create, blog_post_id: blog_post,
                      comment: valid_attributes
        expect(response).to redirect_to(blog_post_path(blog_post))
      end
      it 'fails and redirects to the blog post' do
        post :create, blog_post_id: blog_post,
                      comment: invalid_attributes
        expect(response).to redirect_to(blog_post_path(blog_post))
      end
    end

    describe 'DELETE #destroy' do
      let(:comment) { create(:comment, user: user) }
      it 'deletes a comment and redirects to index' do
        delete :destroy, id: comment, blog_post_id: comment.blog_post
        expect(response).to redirect_to(blog_post_path(comment.blog_post))
      end
    end

    describe 'PUT #update' do
      let(:comment) { create(:comment, user: user) }
      let(:valid_attributes) { attributes_for(:comment, comment_entry: 'switching out a comment entry') }
      let(:invalid_attributes) {
        attributes_for(:comment, comment_entry: '')
      }

      it 'updates the attributes' do
        put :update, id: comment,
                     blog_post_id: comment.blog_post,
                     comment: valid_attributes
        comment.reload
        expect(comment.comment_entry).to eql("switching out a comment entry")
      end
      it 'redirects to show' do
        put :update, id: comment,
                     blog_post_id: comment.blog_post,
                     comment: valid_attributes
        expect(response).to redirect_to comment.blog_post
      end
      it 'fails and redirects to show' do
        put :update, id: comment,
                  blog_post_id: comment.blog_post,
                  comment: invalid_attributes
        expect(response).to redirect_to comment.blog_post
      end
    end
  end
end
