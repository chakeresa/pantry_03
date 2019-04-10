require './lib/ingredient'

class Recipe
  attr_reader :name, :ingredients

  def initialize(name)
    @name = name
    @ingredients = {}
  end

  def add_ingredient(ingredient_obj, quantity_needed)
    @ingredients[ingredient_obj] = quantity_needed
  end

  def quantity_needed(ingredient_obj)
    @ingredients[ingredient_obj]
  end

  def total_calories
    @ingredients.keys.sum do |ingredient_obj|
      units_of_ingred_per_recipe = @ingredients[ingredient_obj]
      calories_per_unit_of_ingred = ingredient_obj.calories
      units_of_ingred_per_recipe *  calories_per_unit_of_ingred
    end
  end
end
