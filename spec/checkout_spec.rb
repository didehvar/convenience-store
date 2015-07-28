require 'spec_helper'

RSpec.describe Checkout do
  describe '#scan' do
    it 'adds an item to the checkout basket' do
      co = Checkout.new Rule.new

      item = Item.new Item.products.keys.first.to_s
      co.scan(item)

      expect(co.instance_variable_get(:@items)).to include item
    end
  end
end
