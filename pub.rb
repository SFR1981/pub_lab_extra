class Pub

attr_reader(:name, :till, :drinks)

  def initialize(name, till, drinks)

    @name = name
    @till = till
    @drinks = drinks

  end

  # @stock = {
  #   @drink1 => 23,
  #   @drink2 =>10
  # }
  #
  # total_value = 0
  # for drink in @stock.keys()
  #   total_value += drink.price * @stock[drink]
  # end
  # return total_value

  def add_drink(drink)

    @drinks << drink

  end

  def sells_drink(drink)

    @drinks[drink] -= 1

  end

  def sale(drink)
    @till += drink.price()

  end

  def serve?(age)
      return true if age >= 18
      return false if age < 18

  end

   def drunk?(drunkeness)
      return (drunkeness > 20.0)

   end


   def check_stock(drink)
     return drinks[drink]

   end

   def total_stock_value
      total_value = 0
      for drink in @drinks.keys()
        total_value += drink.price() * @drinks[drink]
      end
      return total_value

   end


end
