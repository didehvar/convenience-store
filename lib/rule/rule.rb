class Rule
  attr_accessor :items

  def count(code)
    @items.select { |i| i.code == code }.size
  end
end
