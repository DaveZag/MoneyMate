require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { create(:user) }

  # Test associations
  it { should belong_to(:author) }
  it { should have_many(:transactions) }

  # Test validation
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:icon) }
  

  context 'when creating a group' do
    subject { Group.new(name: 'Games', icon: 'games.jpg', author: user) }

    before { subject.save }

    it 'should be not valid when name is not present ' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be not valid when icon not present' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'should be vaild if name and icon are presence' do
      expect(subject).to be_valid
    end
  end
end