require 'rails_helper'

RSpec.describe Food, type: :model do
  user = User.create(name: 'User1')
  subject { described_class.new }
  before :each do
    subject.user = user
    subject.name = 'Pizza'
    subject.measurement_unit = 'gram'
    subject.price = 50
    subject.quantity = 'Heat it'
  end

  it 'Subject should be valid' do
    expect(subject).to be_valid
  end

  it 'Should have a name' do
    subject.name = 'Pizza'
    expect(subject).to be_valid
  end
  it 'Should have a unit' do
    subject.measurement_unit = 'gram'
    expect(subject).to be_valid
  end
  it 'Should have price value' do
    subject.price = '50'
    expect(subject).to be_valid
  end
  it 'Should have a quantity' do
    subject.quantity = '0'
    expect(subject).to be_valid
  end
end
