require 'rails_helper'

RSpec.describe 'recipes/edit', type: :view do
  let(:recipe) do
    Recipe.create!(
      name: 'MyString',
      preparation_time: '9.99',
      cooking_time: '9.99',
      description: 'MyText',
      public: false,
      user: nil
    )
  end

  before(:each) do
    assign(:recipe, recipe)
  end
end
