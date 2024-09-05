# program that takes a recipe hash of ingredients and their amounts
# and a pantry hash of ingredients available with their amounts
# return an integer of how many 'cakes' you can bake with the given 
# available & necessary amounts 

# check if all ingredients necessary are available in pantry
# check that all ingredient amounts in pantry are > than in recipe
# divide all the amounts from pantry with recipe to calculate ratios
# and return the lowest number 

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
    # "You are missing some ingredients" unless have_all_ingredients?
    # "You don't have enough from some of the ingredients" unless have_necessary_amounts?
  end
end

recipe = { "flour" => 300, "sugar" => 200, "eggs" => 2 }
pantry = { "flour" => 500, "sugar" => 200, "eggs" => 3, "milk" => 1 }

calculate_baking = CalculateBaking.new(recipe, pantry)

puts calculate_baking.have_all_ingredients?
puts calculate_baking.have_necessary_amounts?
