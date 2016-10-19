require 'rails_helper'

RSpec.describe BlogPostsController do
  context "when user is signed in" do
    let(:user) {FactoryGirl.create(:user)}
    before do
      sign_in(user)
    end
    describe "GET #new" do
      it "have http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
    describe "GET #edit" do
      let(:blog_post) {FactoryGirl.create(:blog_post, user: user)}
      it "have http success" do
        get :edit, id: blog_post
      expect(response).to have_http_status(:success)
      end
    end
  end
end
