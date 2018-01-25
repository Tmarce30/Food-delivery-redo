class Order
  attr_accessor :id, :delivered
  attr_reader :employee, :meal, :customer

  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @customer = attributes[:customer]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def self.headers
    %w(id delivered meal employee customer)
  end

  def csv_row
    [@id, @delivered, @meal, @employee, @customer]
  end
end
