require 'rails_helper'

RSpec.describe BlogPost do
  context 'Associations' do
    it { should belong_to(:user) }
  end
  %i(comments taggings tags).each do |has_many_association|
    it { should have_many has_many_association }
  end

  describe 'title' do
    it 'cannot be empty' do
      title = FactoryGirl.build(:blog_post, title: '')
      expect(title).to_not be_valid
    end
  end
  describe 'blog entry' do
    it 'cannot be empty' do
      entry = FactoryGirl.build(:blog_post, blog_entry: '')
      expect(entry).to_not be_valid
    end
  end
end
