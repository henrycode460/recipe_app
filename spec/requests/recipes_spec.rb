require 'rails_helper'

RSpec.describe Recipe, type: :request do
  user = User.create(name: 'User1', email: 'a@com', password: 'qwerty')

  subject { described_class.new }
  before :each do
    subject.user = user
    subject.name = 'Rice'
    subject.preparation_time = 5
    subject.cooking_time = 3.5
    subject.description = 'Boil it'
    subject.save
    sign_in user
  end

  it " '/recipes' should lead to the recipe index page" do
    get recipes_path
    expect(response).to render_template(:index)
  end
  it " '/recipes/new' should lead to recipe new page" do
    get new_recipe_path
    expect(response).to render_template(:new)
  end
  it " '/recipes/:id' should lead to the recipe's show page" do
    get recipe_path subject
    expect(response).to render_template(:show)
  end
end
