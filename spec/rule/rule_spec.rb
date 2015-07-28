require 'spec_helper'

RSpec.describe Rule do
  describe '#count' do
    it 'counts the occurrences of an item code' do
      a = Item.new Item.products.keys.first.to_s
      b = Item.new Item.products.keys.at(1).to_s

      rule = Rule.new
      rule.items = [a, a, a, b]

      expect(rule.count(a.code)).to eq 3
      expect(rule.count(b.code)).to eq 1
    end
  end
end
