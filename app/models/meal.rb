class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def self.headers
    %w(id name price)
  end

  def csv_row
    [@id, @name, @price]
  end

  def to_s
    "#{@id}. #{@name} | #{@price.to_s}$"
  end
end
