require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @apple_pie = Recipe.new("apple pie")
    @apple = Ingredient.new("apple", "ct", 150)
    @sugar = Ingredient.new("sugar", "cup", 700)
  end

  def test_it_exists
    assert_instance_of Recipe, @apple_pie
  end

  def test_it_inits_w_a_name_and_no_ingredients
    assert_equal "apple pie", @apple_pie.name
    assert_equal ({}), @apple_pie.ingredients
  end

  def test_add_ingredient_puts_ingredient_objects_and_amt_reqd_into_ingredients_hash
    @apple_pie.add_ingredient(@apple, 2)

    expected = {@apple => 2}

    assert_equal expected, @apple_pie.ingredients
  end

  def test_ingredient_list_returns_ary_with_nested_hashes_of_all_ingredient_names_and_amts_reqd_with_units
    @apple_pie.add_ingredient(@apple, 2)
    @apple_pie.add_ingredient(@sugar, 1.5)

    expected = [
      {:ingredient=>"apple", :amount=>"2 ct"},
      {:ingredient=>"sugar", :amount=>"1.5 cup"}
    ]

    assert_equal expected, @apple_pie.ingredient_list
  end

  def test_quantity_needed_returns_amt_needed_fora_particular_ingredient
    @apple_pie.add_ingredient(@apple, 2)

    assert_equal 2, @apple_pie.quantity_needed(@apple)
  end

  def test_total_calories_sums_calories_of_all_reqd_ingredient_amounts
    @apple_pie.add_ingredient(@apple, 2)
    @apple_pie.add_ingredient(@sugar, 1.5)

    expected = 2 * 150 + 1.5 * 700

    assert_equal expected,  @apple_pie.total_calories
  end
end
