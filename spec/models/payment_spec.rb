require 'rails_helper'

RSpec.describe Payment, type: :model do
  # Test validation
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:group) }

  # Test associations
  it { should belong_to(:author) }
  it { should belong_to(:group) }
end