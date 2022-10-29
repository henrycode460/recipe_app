require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  food = Food.create
  recipe = Recipe.create
  subject { described_class.new }
  before :each do
    subject.recipe = recipe
    subject.food = food
    subject.quantity = 5
  end

  it 'Expect the subject to be valid' do
    expect(subject).to be_valid
  end

  it 'Should have quantity with numeric value ' do
    subject.quantity = 'Three'
    expect(subject).to_not be_valid
  end
  it 'Should have quantity greater than zero' do
    subject.quantity = -5
    expect(subject).to_not be_valid
  end
end
