class Bulk < Rule
  ##
  # Create a new bulk rule for an item with +code+.
  #
  # If the +amount+ of items with +code+ in the checkout process are present,
  # then the price for each one changes to +new_price+.

  def initialize(code, amount, new_price)
    @code = code
    @amount = amount
    @price = new_price
  end

  def calculate(items)
    @items = items

    diff = @price - Item.products[@code][:price]
    count = count(@code)

    return diff * count if count == @amount
  end
end
