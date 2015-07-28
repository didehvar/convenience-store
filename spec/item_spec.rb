require 'spec_helper'

RSpec.describe Item do
  describe '#initialize' do
    it 'finds the correct item' do
      item = Item.new 'GR1'
      expect(item.name).to eq('Green tea')
      expect(item.price).to eq(3.11)
    end
  end
end
