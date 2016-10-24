require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    it 'returns only user name' do
      user = FactoryGirl.build(:user, name: 'Lukas')

      expect(user.name).to eq 'Lukas'
    end
    it 'requires a password' do
      user = FactoryGirl.build(:user, password: nil)

      expect(user).to be_invalid
    end
    it 'requires an email' do
      user = FactoryGirl.build(:user, email: nil)

      expect(user).to be_invalid
    end
  end
end
