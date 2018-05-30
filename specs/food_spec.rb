require("minitest/autorun")
require_relative("../food.rb")


class FoodTest < MiniTest::Test

  def setup
    @food = Food.new("chips", 1.50, 2.0)
  end


def test_food_has_name
  assert_equal("chips", @food.name())

end

def test_food_has_price

  assert_equal(1.50, @food.price())
end

def test_food_has_rejuvenation_level

  assert_equal(2.0, @food.rejuvenation_level())

end

end
