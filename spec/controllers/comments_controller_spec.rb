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
      it 'creates a new comment' do
        expect {
          post :create, blog_post_id: blog_post, comment: attributes_for(:comment)
        }.to change(Comment, :count).by(1)
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
      let(:comment_params_hash) { attributes_for(:comment, comment_entry: 'switching out a comment entry') }

      it 'updates the attributes' do
        put :update, id: comment,
                     blog_post_id: comment.blog_post,
                     comment: comment_params_hash
        comment.reload
        expect(comment.comment_entry).to eql("switching out a comment entry")
      end
      it 'redirects to show' do
        put :update, id: comment,
                     blog_post_id: comment.blog_post,
                     comment: comment_params_hash
        expect(response).to redirect_to comment.blog_post
      end
    end
  end
end
