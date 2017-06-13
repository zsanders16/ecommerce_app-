require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'it has a name' do
    it { should validate_presence_of(:name) }
    it { should have_many(:items) }
  end
end
