require_relative '../models/order.rb'
require_relative '../repositories/order_repository.rb'
require_relative '../repositories/meal_repository.rb'
require_relative '../repositories/employee_repository.rb'
require_relative '../repositories/customer_repository.rb'
# require_relative '../views/view_order.rb'

class OrdersController
  def initialize(order_repository, meal_repository, employee_repository, customer_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    # @view = ViewOrder.new
  end
end
