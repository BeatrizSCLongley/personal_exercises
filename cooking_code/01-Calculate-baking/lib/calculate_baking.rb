# program that takes a recipe hash of ingredients and their amounts
# and a pantry hash of ingredients available with their amounts
# return an integer of how many 'cakes' you can bake with the given 
# available & necessary amounts 

# check if all ingredients necessary are available in pantry
# check that all ingredient amounts in pantry are > than in recipe
# divide all the amounts from pantry with recipe to calculate ratios
# and return the lowest number 

# HOW TO IMPROVE THE CODE / WHAT TO DO NEXT

class CalculateBaking
  def initialize(recipe, pantry)
    @recipe = recipe
    @pantry = pantry
    @number_necessary_ingredients = recipe.size
  end
  
  def have_all_ingredients?
    count = 0
    @pantry.each_key do |key|
      @recipe.each_key { |k| count += 1 if key == k }
    end

    count == @number_necessary_ingredients
  end
  
  def have_necessary_amounts?
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
    "You are missing some ingredients" unless have_all_ingredients? && have_necessary_amounts?

    ratios = calculate_ratios
    ratios.min
  end

  private

  def calculate_ratios
    ratios = []
    @pantry.each_pair do |key, value|
      @recipe.each_pair do |ingredient, amount|
        if key == ingredient
          ratios << value / amount
        end
      end
    end

    ratios
  end
end

recipe = { "flour" => 300, "sugar" => 200, "eggs" => 2 }
pantry = { "flour" => 2000, "sugar" => 400, "eggs" => 5, "milk" => 1 }

calculate_baking = CalculateBaking.new(recipe, pantry)

puts calculate_baking.have_all_ingredients?
puts calculate_baking.have_necessary_amounts?
puts calculate_baking.number_of_cakes
