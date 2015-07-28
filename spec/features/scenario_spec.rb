require 'spec_helper'

RSpec.describe 'Scenario', :type => :feature do
  before :all do
    @tea = Item.new 'GR1'
    @strawberries = Item.new 'SR1'
    @coffee = Item.new 'CF1'

    @pricing_rules = [
      Bulk.new(@strawberries.code, 3, 4.50),
      Bxgyf.new(@tea.code, 2, 1)
    ]
  end

  before :each do
    @co = Checkout.new @pricing_rules
  end

  it 'works with test data #1' do
    @co.scan('GR1')
    @co.scan('SR1')
    @co.scan('GR1')
    @co.scan('GR1')
    @co.scan('CF1')

    expect(@co.total).to eq 22.45
  end

  it 'works with test data #2' do
    @co.scan('GR1')
    @co.scan('GR1')

    expect(@co.total).to eq 3.11
  end

  it 'works with test data #3' do
    @co.scan('SR1')
    @co.scan('SR1')
    @co.scan('GR1')
    @co.scan('SR1')

    expect(@co.total).to eq 16.61
  end

  it 'works in any order' do
    # using test data #1
      @co.scan('GR1')
      @co.scan('GR1')
      @co.scan('GR1')
      @co.scan('CF1')
      @co.scan('SR1')

      expect(@co.total).to eq 22.45
  end
end
