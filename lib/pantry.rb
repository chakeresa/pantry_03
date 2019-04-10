require './lib/ingredient'
require './lib/recipe'

class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient_obj)
    @stock[ingredient_obj]
  end

  def restock(ingredient_obj, amt_to_stock)
    @stock[ingredient_obj] += amt_to_stock
  end

  def enough_ingredients_for?(recipe_obj)
    recipe_obj.ingredients.all? do |ingredient_obj, quantity_needed|
      quantity_needed <= @stock[ingredient_obj]
    end
  end
end
