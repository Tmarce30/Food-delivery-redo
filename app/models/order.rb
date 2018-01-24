class Order
  attr_accessor :id, :delivered

  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end
end
