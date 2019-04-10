require 'minitest/autorun'
require 'minitest/pride'
require './lib/cook_book'

class PantryTest < Minitest::Test
  def setup
    @cookbook = CookBook.new
  end

  def test_it_exists
    assert_instance_of CookBook, @cookbook
  end
end
