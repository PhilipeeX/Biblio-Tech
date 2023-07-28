require 'rails_helper'

RSpec.describe Book, type: :model do
  context "associations" do
    it { should belong_to(:author) }
  end
end
