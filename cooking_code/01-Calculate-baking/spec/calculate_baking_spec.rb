# frozen_string_literal: true

require 'calculate_baking'
require 'compare_ingredients'

describe CalculateBaking do
  let(:recipe) { { 'flour' => 300, 'sugar' => 200, 'eggs' => 2 } }
  let(:full_pantry) { { 'flour' => 2000, 'sugar' => 400, 'eggs' => 5, 'milk' => 1 } }
  let(:low_pantry) { { 'flour' => 100, 'sugar' => 100, 'eggs' => 1 } }
  let(:empty_pantry) { {} }
  let(:compare_ingredients) { CompareIngredients }

  context 'When we have enough ingredients in our pantry' do
    let(:calculate_baking) { described_class.new(recipe, full_pantry) }
    let(:comparison_instance) { compare_ingredients.new(recipe, full_pantry) }

    before do
      allow(compare_ingredients).to receive(:new).and_call_original
      allow(compare_ingredients).to receive(:new).with(recipe, full_pantry).and_return(comparison_instance)
      allow(comparison_instance).to receive(:all_ingredients?).and_return(true)
    end

    describe '#number_of_cakes' do
      it 'calls CompareIngredients #all_ingredients? method and returns true' do
        comparison_result = comparison_instance.all_ingredients?

        expect(compare_ingredients).to have_received(:new).with(recipe, full_pantry).at_least(1)
        expect(comparison_instance).to have_received(:all_ingredients?)
        expect(comparison_result).to eq true
      end

      it 'returns the number of cakes the user can bake with the given ingredients' do
        expect(calculate_baking.number_of_cakes).to eq 2
      end
    end
  end

  context 'When we don\'t have enough ingredients in our pantry' do
    let(:calculate_baking) { described_class.new(recipe, low_pantry) }
    let(:comparison_instance) { compare_ingredients.new(recipe, low_pantry) }
    let(:missing_ingredient_message) { 'You are missing some ingredients' }

    before do
      allow(compare_ingredients).to receive(:new).and_call_original
      allow(compare_ingredients).to receive(:new).with(recipe, low_pantry).and_return(comparison_instance)
      allow(comparison_instance).to receive(:all_ingredients?).and_return(false)
    end

    describe '#number_of_cakes' do
      it 'calls CompareIngredients instance method #all_ingredients? and returns false' do
        comparison_result = comparison_instance.all_ingredients?

        expect(compare_ingredients).to have_received(:new).with(recipe, low_pantry).at_least(1)
        expect(comparison_instance).to have_received(:all_ingredients?)
        expect(comparison_result).to eq false
      end

      it 'returns an error message' do
        expect(calculate_baking.number_of_cakes).to eq missing_ingredient_message
      end
    end
  end

  context 'When we don\'t have any ingredients in our pantry' do
    let(:calculate_baking) { described_class.new(recipe, empty_pantry) }
    let(:empty_pantry_message) { 'Your pantry is empty' }

    describe '#number_of_cakes' do
      it 'returns an error message' do
        expect(calculate_baking.number_of_cakes).to eq empty_pantry_message
      end
    end
  end
end
