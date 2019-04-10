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
end
