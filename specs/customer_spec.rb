require("minitest/autorun")
require_relative("../customer.rb")
require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../food.rb")

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Helen", 100.99, 27)
    @customer2 = Customer.new("Tony", 5.80, 11)
    @drink1 = Drink.new("WKD", 1.20, 5.05)
    @drink2 = Drink.new("stella", 5.80, 6.0)
    @drink3 = Drink.new("bulmers", 3.70, 4.8)
    @pub = Pub.new("chanter", 500.99, [@drink1, @drink3, @drink2])
    @food = Food.new("chips", 1.50, 2.0)
  end


  def test_customer_has_name

    assert_equal("Helen", @customer1.name())

  end

  def test_customer_has_wallet
    assert_equal(100.99, @customer1.wallet())
  end

  def test_customer_has_age
    assert_equal(27, @customer1.age())

  end

  def test_spends
    @customer1.spends(@drink2)
    money = @customer1.wallet()
    assert_equal(95.19, money)


  end

  def test_customer_buys_a_drink

    @customer1.buys(@drink2, @pub)
    assert_equal(95.19, @customer1.wallet())
    assert_equal(506.79, @pub.till())


  end
  def test_customer_can_not_get_a_drink

    @customer2.buys(@drink2, @pub)
    assert_equal(5.80, @customer2.wallet())
    assert_equal(500.99, @pub.till())


  end

  def test_customer_drunkeness
    assert_equal(0.0, @customer2.drunkeness())
  end


  def test_customer_alcohol_level_increases
    @customer1.buys(@drink2, @pub)
    assert_equal(6.0, @customer1.drunkeness())


  end

  def test_customer_is_refused
    @customer1.buys(@drink1, @pub)
    @customer1.buys(@drink1, @pub)
    @customer1.buys(@drink1, @pub)
    @customer1.buys(@drink1, @pub)
    @customer1.buys(@drink1, @pub)
    assert_equal(96.19, @customer1.wallet().round(2))


  end

  def test_customer_buys_food_is_rejuvenated
      @customer1.buys(@drink1, @pub)
      @customer1.buys_food(@food, @pub)
      assert_equal(3.05, @customer1.drunkeness())
  end



end
