# frozen_string_literal: true

# class that takes a recipe hash of ingredients and a pantry hash
# and checks that the pantry has all the ingredients needed in the recipe
# and that the quantities are equal or higher than the ones needed in the recipe
class CompareIngredients
  def initialize(recipe, pantry)
    @recipe = recipe
    @pantry = pantry
    @number_necessary_ingredients = recipe.size
  end

  def all_ingredients?
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
end
