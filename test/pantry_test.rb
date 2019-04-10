require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_stock_inits_to_an_empty_hash
    assert_equal ({}), @pantry.stock
  end

  def test_stock_returns_zero_if_ingredient_not_in_stock
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_restock_adds_to_amt_of_that_ingredient_in_stock
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_enough_ingredients_for_returns_false_if_stock_doesnt_have_enough_of_all_ingredients_in_the_recipe
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)
    # ain't got no mac! no mac & cheese for you
  end

  def test_enough_ingredients_for_returns_true_if_stock_has_enough_of_all_ingredients_in_the_recipe
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    @pantry.restock(@mac, 8)

    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end
