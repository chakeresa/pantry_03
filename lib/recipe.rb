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
end
