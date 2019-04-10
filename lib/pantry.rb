require './lib/ingredient'
require './lib/recipe'

class Pantry
  attr_reader :stock
  
  def initialize
    @stock = {}
  end
end
