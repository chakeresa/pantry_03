require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe_obj)
    @recipes << recipe_obj
  end
end
