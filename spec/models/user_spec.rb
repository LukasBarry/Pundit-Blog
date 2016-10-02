require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'email' do
    it "can't be nil" do
      user = FactoryGirl.build(:user, email: nil)

      expect(user).to be_invalid
    end
  end
end
