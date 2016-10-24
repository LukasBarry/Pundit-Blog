require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe Tagging do
    %i(blog_post tag).each do |belong_to_association|
      it { should belong_to belong_to_association }
    end
  end
end
