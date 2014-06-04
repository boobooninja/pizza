class Pizza
  attr_reader :toppings, :delivery_time

  def initialize(toppings = [Topping.new('cheese')])
    @toppings = toppings
  end

  def vegetarian?
    toppings.all? {|t| t.vegetarian == true}
  end

  def add_topping(topping)
    toppings << topping
    true
  end

  def deliver!
    @delivery_time = Time.now + 30 * 60
  end

  def late?
    delivery_time < Time.now
  end
end

class Topping
  attr_accessor :name, :vegetarian

  def initialize(name, vegetarian: false)
    @name = name
    @vegetarian = vegetarian
  end
end
