require 'spec_helper'

RSpec.describe Bulk do
  before :all do
    @item_a = Item.new Item.products.keys.first.to_s
    @item_b = Item.new Item.products.keys.at(1).to_s
  end

  describe '#calculate' do
    it 'returns no difference if the rule is not met' do
      new_price = @item_a.price - 1

      rule = Bulk.new(@item_a.code, 2, new_price)
      item_arr = Array.new(3, @item_a) + Array.new(2, @item_b)

      expect(rule.calculate(item_arr)).to eq nil
    end

    it 'works out cost differences based on the defined rule' do
      @item_a = Item.new Item.products.keys.first.to_s
      @item_b = Item.new Item.products.keys.at(1).to_s

      new_price = @item_a.price - 1

      rule = Bulk.new(@item_a.code, 3, new_price)
      item_arr = Array.new(3, @item_a) + Array.new(2, @item_b)

      expect(rule.calculate(item_arr)).to eq -3
    end
  end
end
