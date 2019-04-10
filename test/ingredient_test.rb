require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest < Minitest::Test
  def setup
    @apple = Ingredient.new("apple", "1 ct", 150)
  end

  def test_it_exists
    assert_instance_of Ingredient, @apple
  end

  def test_it_inits_w_name_unit_and_calories
    assert_equal "apple", @apple.name
    assert_equal "1 ct", @apple.unit
    assert_equal 150, @apple.calories
  end
end
