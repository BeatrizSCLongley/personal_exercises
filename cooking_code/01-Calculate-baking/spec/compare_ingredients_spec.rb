# frozen_string_literal: true

require 'compare_ingredients'

describe CompareIngredients do
  let(:recipe) { { 'flour' => 300, 'sugar' => 200, 'eggs' => 2 } }
  let(:full_pantry) { { 'flour' => 2000, 'sugar' => 400, 'eggs' => 5, 'milk' => 1 } }
  let(:low_pantry) { { 'flour' => 100, 'sugar' => 100, 'eggs' => 1 } }

  context 'When we have enough ingredients in our pantry' do
    let(:compare_ingredients) { described_class.new(recipe, full_pantry) }

    describe '#all_ingredients?' do
      it 'returns true' do
        expect(compare_ingredients.all_ingredients?).to eq true
      end
    end
  end

  context 'When we don\'t have enough ingredients in our pantry' do
    let(:compare_ingredients) { described_class.new(recipe, low_pantry) }

    describe '#all_ingredients?' do
      it 'returns false' do
        expect(compare_ingredients.all_ingredients?).to eq false
      end
    end
  end
end
