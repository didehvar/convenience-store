require 'spec_helper'

RSpec.describe Rule do
  before :all do
    @item_a = Item.new Item.products.keys.first.to_s
    @item_b = Item.new Item.products.keys.at(1).to_s
    @items = [@item_a, @item_a, @item_a, @item_b]
  end

  describe '#calculate' do
    it 'returns zero as no rule has been defined' do
      rule = Rule.new
      expect(rule.calculate(@items)).to eq 0
    end
  end

  describe '#count' do
    it 'counts the occurrences of an item code' do
      rule = Rule.new
      rule.items = @items

      expect(rule.count(@item_a.code)).to eq 3
      expect(rule.count(@item_b.code)).to eq 1
    end
  end
end
