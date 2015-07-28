require 'spec_helper'

RSpec.describe Checkout do
  describe '#initialize' do
    it 'should require pricing rules' do
      expect { Checkout.new }.to raise_error(ArgumentError)
    end
  end
end
