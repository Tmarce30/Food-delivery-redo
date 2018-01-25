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
    meal_id = @view.ask_user_for_input('meal id', true)
    meal = @meal_repository.find(meal_id)

    customer_id = @view.ask_user_for_input('customer id', true)
    customer = @customer_repository.find(customer_id)

    employee_id = @view.ask_user_for_input('employee id', true)
    employee = @employee_repository.find(employee_id)

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.add(order)
  end

  def list_my_orders(employee)
    orders = @order_repository.undelivered_orders
    my_orders = orders.select { |order| order.employee.username == employee.username}
    @view.display(my_orders)
  end

  def mark_as_delivered(employee)
    order = @view.ask_user_for_id
    @order_repository.find(order).deliver!
    @order_repository.save
  end
end
