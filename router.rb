# TODO: implement the router of your app.
class Router
  def initialize(customers_controller, meals_controller, orders_controller)
    @customers_controller = customers_controller
    @meals_controller = meals_controller
    @orders_controller = orders_controller

    @running = true
  end

  def run
    while @running
      display_tasks
      action = gets.chomp.to_i
      route_action(action)
    end
  end
end
