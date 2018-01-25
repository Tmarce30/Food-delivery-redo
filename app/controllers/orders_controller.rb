require_relative '../models/order.rb'
require_relative '../repositories/order_repository.rb'
require_relative '../repositories/meal_repository.rb'
require_relative '../repositories/employee_repository.rb'
require_relative '../repositories/customer_repository.rb'
require_relative '../views/view_order.rb'

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @order_repository = order_repository
    @view = ViewOrder.new
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @view.display(orders)
  end

  def add
    attributes = @view.ask_user_for_order_infos(@meal_repository, @customer_repository, @employee_repository)
    meal = @meal_repository.find(attributes[:meal])
    customer = @customer_repository.find(attributes[:customer])
    employee = @employee_repository.find(attributes[:employee])
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.add(order)
  end

  def list_my_orders(employee)
    orders = @order_repository.undelivered_orders
    my_orders = orders.select { |order| order.employee.username == employee.username}
    @view.display(my_orders)
  end
end
