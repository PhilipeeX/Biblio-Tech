require 'rails_helper'

RSpec.describe Assembly, type: :model do
  it { should have_and_belong_to_many(:parts) }
end
