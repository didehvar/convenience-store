require 'spec_helper'

RSpec.describe Bxgyf do
  before :all do
    @item_a = Item.new Item.products.keys.first.to_s
    @item_b = Item.new Item.products.keys.at(1).to_s
  end

  describe '#calculate' do
    it 'returns no difference if the rule is not met' do
      new_price = @item_a.price - 1

      rule = Bxgyf.new(@item_a.code, 4, 1)
      item_arr = Array.new(3, @item_a) + Array.new(2, @item_b)

      expect(rule.calculate(item_arr)).to eq 0
    end

    it 'works out cost differences based on the defined rule' do
      new_price = @item_a.price - 1

      rule = Bxgyf.new(@item_a.code, 2, 1)
      item_arr = Array.new(2, @item_a) + Array.new(2, @item_b)

      expect(rule.calculate(item_arr)).to eq -@item_a.price
    end
  end
end
