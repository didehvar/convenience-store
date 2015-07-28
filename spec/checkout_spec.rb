require 'spec_helper'

RSpec.describe Checkout do
  before :all do
    @item_a = Item.new Item.products.keys.first.to_s
    @item_b = Item.new Item.products.keys.at(1).to_s
  end

  describe '#scan' do
    it 'adds an item to the checkout basket' do
      co = Checkout.new Rule.new

      @item_a = Item.new Item.products.keys.first.to_s
      co.scan(@item_a)

      expect(co.instance_variable_get(:@items)).to include @item_a
    end
  end

  describe '#total' do
    it 'totals the checkout basket' do
      co = Checkout.new Rule.new

      co.scan(@item_a)
      2.times { co.scan @item_b }

      expect(co.total).to eq @item_a.price + @item_b.price * 2
    end

    it 'totals the checkout basket, including any rules' do
      co = Checkout.new Bulk.new(@item_a.code, 3, @item_a.price - 2)

      4.times { co.scan @item_a }
      3.times { co.scan @item_b }

      # calcaulate cost, take off discount
      # (-2 per each @item_a when 3+ @item_a in basket)
      total = (@item_a.price * 4) + (@item_b.price * 3) - (2 * 4)
      expect(co.total).to eq total
    end
  end
end
