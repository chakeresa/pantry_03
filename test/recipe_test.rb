require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @apple_pie = Recipe.new("apple pie")
  end

  def test_it_exists
    assert_instance_of Recipe, @apple_pie
  end

  def test_it_inits_w_a_name
    assert_equal "apple pie", @apple_pie.name
  end
end
