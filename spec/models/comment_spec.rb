require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe Comment do
    %i(blog_post user).each do |belongs_to_association|
      it { should belong_to belongs_to_association }
    end
  end
  describe 'comment entry' do
    it 'cannot be empty' do
      entry = FactoryGirl.build(:comment, comment_entry: nil)
      expect(entry).to_not be_valid
    end
  end
end
