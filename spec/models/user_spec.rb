require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Dave', email: 'dave@gmail.com', password: '1234567')
  end
  it 'User should be valid' do
    expect(@user).to be_valid
  end

  it 'should return the correct Username' do
    expect(@user.name).to be 'Dave'
  end

  it 'User should be invalid' do
    @user.name = ''
    expect(@user).to_not be_valid

    @user.email = ''
    expect(@user).to_not be_valid

    @user.password = ''
    expect(@user).to_not be_valid
  end
end
