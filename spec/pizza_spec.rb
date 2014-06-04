require './pizza'

describe Pizza do
  it "exists" do
    expect(Pizza).to be_a(Class)
  end

  describe ".initialize" do
    it 'records all of the toppings' do
      toppings = [ Topping.new('mushrooms', vegetarian: true),
                   Topping.new('pepperoni')
                 ]
      pizza = Pizza.new(toppings)

      expect(pizza.toppings).to eq(toppings)
    end
  end

  describe 'vegetarian?' do
    it 'returns true if all toppings are vegetarian' do
      toppings = [ Topping.new('mushrooms', vegetarian: true),
                   Topping.new('olives', vegetarian: true)
                 ]
      pizza = Pizza.new(toppings)

      expect(pizza.vegetarian?).to be_true
    end
  end

  describe 'add_topping' do
    it 'adds a topping to the toppings array' do
      pizza = Pizza.new
      topping = Topping.new('pepper', vegetarian: true)

      expect(pizza.add_topping(topping)).to eq(true)
      expect(pizza.toppings.last.name).to eq('pepper')
    end
  end

  describe 'deliver!' do
    it 'sets the delivery_time for 30 minutes from now' do
      pizza = Pizza.new
      time = pizza.deliver!

      expect(pizza.delivery_time).to eq(time)
    end
  end
end

describe Topping do
  it "exists" do
    expect(Topping).to be_a(Class)
  end

  describe '.initialize' do
    it "sets the name of the topping" do
      topping = Topping.new('olives')

      expect(topping.name).to eq('olives')
    end

    it "sets whether or not the topping is vegetarian" do
      topping = Topping.new('bell peppers', vegetarian: true)

      expect(topping.vegetarian).to eq(true)
    end

    it 'defaults the toppings to cheese only, if the pizza has no toppings' do
      pizza = Pizza.new

      expect(pizza.toppings.size).to eq(1)
      expect(pizza.toppings.first.name).to eq('cheese')
    end
  end
end
