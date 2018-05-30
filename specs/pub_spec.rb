require("minitest/autorun")
require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../customer.rb")

class PubTest < MiniTest::Test

def setup
@drink1 = Drink.new("WKD", 1.20, 5.05)
@drink2 = Drink.new("stella", 5.80, 6.0)
@drink3 = Drink.new("bulmers", 3.70, 4.8)
@customer2 = Customer.new("Steve", 19.0, 36)
@customer1 = Customer.new("Tony", 19.0, 11)
drinks = {@drink1 => 23, @drink2 =>10, @drink3 => 80}
@pub = Pub.new("chanter", 500.99, drinks)



end

def test_pub_has_name

assert_equal("chanter", @pub.name())
end

def test_pub_has_till

assert_equal(500.99, @pub.till())
end

def test_pub_has_drinks

assert_equal(3, @pub.drinks().length())
end



 def test_pub_sells_drink

   @pub.sells_drink(@drink3)
   assert_equal(@pub.drinks[@drink3], 79)

 end

 def test_pub_makes_money

     @pub.sale(@drink3)
     assert_equal(504.69, @pub.till())


 end


 def test_pub_serves_customer__over_18

   assert_equal(true, @pub.serve?(@customer2.age))

 end


 def test_pub_serves_customer__underage

   assert_equal(false, @pub.serve?(@customer1.age))

 end


 def test_customer_not_too_drunk
   @customer2.buys(@drink1, @pub)
   assert_equal(false, @pub.drunk?(@customer2.drunkeness()))
 end

  def test_customer_too_drunk
    @customer2.buys(@drink1, @pub)
    @customer2.buys(@drink1, @pub)
    @customer2.buys(@drink1, @pub)
    @customer2.buys(@drink1, @pub)
    assert_equal(true, @pub.drunk?(@customer2.drunkeness()))
end

   def test_pub_has_stock
     assert_equal({@drink1 => 23, @drink2 =>10, @drink3 => 80},@pub.drinks())
  end

  def test_pub_can_check_stock

      assert_equal(10, @pub.check_stock(@drink2))
  end


  def test_pub_can_count_total_stock_value

    assert_equal(381.6,@pub.total_stock_value())

  end


end
