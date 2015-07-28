class Item
  attr_reader :code
  attr_reader :name
  attr_reader :price

  def initialize(code)
    @code = code

    product = Item.products[code]
    @name = product[:name]
    @price = product[:price]
  end

  def self.products
    {
      'GR1' => {
        name: 'Green tea',
        price: 3.11
      },
      'SR1' => {
        name: 'Strawberries',
        price: 5
      },
      'CF1' => {
        name: 'Coffee',
        price: 11.23
      }
    }
  end
end
