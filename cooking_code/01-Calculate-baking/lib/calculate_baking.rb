# frozen_string_literal: true

# program that takes a recipe hash of ingredients and their amounts
# and a pantry hash of ingredients available with their amounts
# return an integer of how many 'cakes' you can bake with the given
# available & necessary amounts
class CalculateBaking
  def initialize(recipe, pantry)
    @recipe = recipe
    @pantry = pantry
    @number_necessary_ingredients = recipe.size
  end

  def all_ingredients?
    count = 0
    @pantry.each_key do |key|
      @recipe.each_key { |k| count += 1 if key == k }
    end

    count == @number_necessary_ingredients
  end

  def necessary_amounts?
    count = 0
    @pantry.each_pair do |key, value|
      @recipe.each_pair do |ingredient, amount|
        if key == ingredient
          count += 1 if value >= amount
        end
      end
    end

    count == @number_necessary_ingredients
  end

  def number_of_cakes
    return 'Your pantry is empty' if @pantry.empty?

    return 'You are missing some ingredients' unless all_ingredients? && necessary_amounts?

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

# HOW TO IMPROVE THE CODE / WHAT TO DO NEXT
# - do we need all these methods?
# - should we remove unecessary elements from pantry?
# - should we save the ingredient(s) missing so we can provide a better sring
