# frozen_string_literal: true

require 'calculate_baking'

describe CalculateBaking do
  let(:recipe) { { 'flour' => 300, 'sugar' => 200, 'eggs' => 2 } }
  let(:full_pantry) { { 'flour' => 2000, 'sugar' => 400, 'eggs' => 5, 'milk' => 1 } }
  let(:low_pantry) { { 'flour' => 100, 'sugar' => 100, 'eggs' => 1 } }
  let(:empty_pantry) { {} }
  let(:empty_pantry_message) { 'Your pantry is empty' }
  let(:missing_ingredient_message) { 'You are missing some ingredients' }

  context 'When we have enough ingredients in our pantry' do
    let(:calculate_baking) { described_class.new(recipe, full_pantry) }

    describe '#have_all_ingredients?' do
      it 'returns true' do
        expect(calculate_baking.all_ingredients?).to eq true
      end
    end

    describe '#have_necessary_amounts?' do
      it 'returns true' do
        expect(calculate_baking.necessary_amounts?).to eq true
      end
    end

    describe '#number_of_cakes' do
      it 'returns the number of cakes the user can bake with the given ingredients' do
        expect(calculate_baking.number_of_cakes).to eq 2
      end
    end
  end

  context 'When we don\'t have enough ingredients in our pantry' do
    let(:calculate_baking) { described_class.new(recipe, low_pantry) }

    describe '#have_all_ingredients?' do
      it 'returns true' do
        expect(calculate_baking.all_ingredients?).to eq true
      end
    end

    describe '#have_necessary_amounts?' do
      it 'returns false' do
        expect(calculate_baking.necessary_amounts?).to eq false
      end
    end

    describe '#number_of_cakes' do
      it 'returns an error message' do
        expect(calculate_baking.number_of_cakes).to eq missing_ingredient_message
      end
    end
  end

  context 'When we don\'t have any ingredients' do
    let(:calculate_baking) { described_class.new(recipe, empty_pantry) }

    describe '#have_all_ingredients?' do
      it 'returns true' do
        expect(calculate_baking.all_ingredients?).to eq false
      end
    end

    describe '#have_necessary_amounts?' do
      it 'returns true' do
        expect(calculate_baking.necessary_amounts?).to eq false
      end
    end

    describe '#number_of_cakes' do
      it 'returns an error message' do
        expect(calculate_baking.number_of_cakes).to eq empty_pantry_message
      end
    end
  end
end
