require 'rails_helper'

RSpec.describe Account, type: :model do
  context "associations" do
    it { should belong_to(:supplier) }
  end
end
