class Checkout
  attr_reader :rules

  def initialize(pricing_rules)
    @rules = pricing_rules
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total

  end
end
