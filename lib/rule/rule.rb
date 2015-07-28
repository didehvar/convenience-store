class Rule
  attr_accessor :items

  def calculate(items)
    @items = items
    return 0
  end

  def count(code)
    @items.select { |i| i.code == code }.size
  end
end
