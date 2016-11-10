require 'rails_helper'

describe Admin::DashboardController do
  render_views

  before do
    @user = create(:user)
    sign_in @user
  end

  describe 'Show dashboard' do
    it 'should render the actual template' do
      get :index
      expect(response).to render_template :index
      expect(response).to have_http_status :ok
    end
  end
end
