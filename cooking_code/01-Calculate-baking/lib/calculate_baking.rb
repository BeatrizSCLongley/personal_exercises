# program that takes a recipe hash of ingredients and their amounts
# and a pantry hash of ingredients available with their amounts
# return an integer of how many 'cakes' you can bake with the given 
# available & necessary amounts 

# check if all ingredients necessary are available in pantry
# check that all ingredient amounts in pantry are > than in recipe
# divide all the amounts from pantry with recipe to calculate ratios
# and return the lowest number 

# don't worry about converting amounts for each ingredient

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
    # if key is same compare value >= v
  end

  def how_many_cakes?
  end
end

recipe = { "flour" => 300, "sugar" => 200, "eggs" => 2 }
pantry = { "flour" => 300, "sugar" => 200, "eggs" => 5, "milk" => 1 }

calculate_baking = CalculateBaking.new(recipe, pantry)

puts calculate_baking.have_all_ingredients?
