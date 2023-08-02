require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe 'associations' do
    it { should have_many(:accounts) }
    it { should have_many(:parts) }
  end
end
