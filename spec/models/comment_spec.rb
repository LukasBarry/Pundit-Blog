require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'comment entry' do
    it 'cannot be empty' do
      entry = FactoryGirl.build(:comment, comment_entry: nil)
      expect(entry).to_not be_valid
    end
  end
end
