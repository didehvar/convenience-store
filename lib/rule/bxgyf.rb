##
# Represents a 'buy x get y free' rule.

class Bxgyf < Rule
  ##
  # Create a new buy +required+ get +free+ free rule for an item with +code+.
  #
  # For each set of +required+ items matching +code+, +free+ are free.

  def initialize(code, required, free)
    @code = code
    @required = required
    @free = free
  end

  def calculate(items)
    super items

    count = count(@code)
    return 0 if count < @required

    # discount is total number / amount required for @free free
    # multiplied by how many are @free and then the cost of each free item
    -((count / @required).round * @free * Item.products[@code][:price])
  end
end
