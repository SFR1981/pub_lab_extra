require("minitest/autorun")
require_relative("../drink.rb")

class DrinkTest < MiniTest::Test

def setup
  @drink2 = Drink.new("WKD", 1.20, 5.05)

end

def test_drink_has_name
  assert_equal("WKD", @drink2.name())
end

def test_drink_has_price
  assert_equal(1.20, @drink2.price())

end


def test_drink_returns_price

  assert_equal(1.20, @drink2.returns_price())

end

def test_drink_has_alcohol_level
  assert_equal(5.05, @drink2.alcohol_level())

end


end
