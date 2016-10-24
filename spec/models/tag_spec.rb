require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe Tag do
    %i(blog_posts taggings).each do |has_many_associations|
      it { should have_many has_many_associations }
    end
  end
  context 'uniqueness validations' do
    tag = FactoryGirl.build(:tag, name: nil)
    it { expect(tag).to validate_uniqueness_of :name }
  end
end
