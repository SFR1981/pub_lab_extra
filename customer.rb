class Customer

  attr_reader(:name, :wallet, :age, :drunkeness)

  def initialize(name, wallet, age)

    @name = name
    @wallet = wallet
    @age = age
    @drunkeness = 0.0

  end

  def spends(drink)

    @wallet -= drink.price() if @wallet >= drink.price()


  end

  def buys(drink, pub)
    if pub.serve?(@age) && !pub.drunk?(@drunkeness)
      spends(drink)
      pub.sale(drink)
      pub.sells_drink(drink)
      @drunkeness += drink.alcohol_level()

    end
  end

  def buys_food(food, pub)
    spends(food)
    pub.sale(food)
    @drunkeness -= food.rejuvenation_level()

  end



end
