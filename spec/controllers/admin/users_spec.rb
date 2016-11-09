require 'rails_helper'

describe Admin::UsersController do
  render_views

  before do
    @user = create(:user)
    sign_in @user
  end

  describe 'Show users index' do
    it 'should render the actual template' do
      get :index
      expect(response).to render_template :index
      expect(response).to have_http_status :ok
    end
  end

  describe 'Edit user' do
    it 'should render the actual template' do
      get :edit, id: @user.id
      expect(response).to render_template :edit
      expect(response).to have_http_status :ok
    end
  end
end
