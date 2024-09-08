# frozen_string_literal: true

require_relative 'compare_ingredients'

# program that takes a recipe hash of ingredients and their amounts
# and a pantry hash of ingredients available with their amounts
# return an integer of how many 'cakes' you can bake
class CalculateBaking
  def initialize(recipe, pantry)
    @recipe = recipe
    @pantry = pantry
  end

  def number_of_cakes
    return 'Your pantry is empty' if @pantry.empty?

    @compare_ingredients = CompareIngredients.new(@recipe, @pantry)
    return 'You are missing some ingredients' unless @compare_ingredients.all_ingredients?

    ratios = calculate_ratios
    ratios.min
  end

  private

  def calculate_ratios
    ratios = []
    @pantry.each_pair do |key, value|
      @recipe.each_pair do |ingredient, amount|
        ratios << value / amount if key == ingredient
      end
    end

    ratios
  end
end
