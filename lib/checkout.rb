require 'pp'

class Checkout
  attr_reader :rules

  def initialize(pricing_rules)
    @rules = Array(pricing_rules)
    @items = []
  end

  def scan(item)
    if !item.is_a?(Item) # assume product code
      item = Item.new item
    end

    @items << item
  end

  def total
    sum = @items.inject(0) { |sum, item| sum + item.price }
    @rules.each { |r| sum += r.calculate(@items) }
    sum
  end
end
