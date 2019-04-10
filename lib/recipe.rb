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

  # def total_calories
  #   @ingredients.keys.sum do |ingredient_obj|
  #     multiplier = @ingredients[ingredient_obj]
  #     units_per_ingredient = calories_per_unit = ingredient_obj.unit
  #     calories_per_unit = ingredient_obj.calories
  #     multiplier * units_per_ingredient *  calories_per_unit
  #   end
  # end
end
