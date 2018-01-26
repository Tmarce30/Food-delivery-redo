# TODO: implement the router of your app.
class Router
  def initialize(customers_controller, meals_controller, orders_controller)
    @customers_controller = customers_controller
    @meals_controller = meals_controller
    @orders_controller = orders_controller

    @running = true
  end

  def run
    puts '* Welcome to your delivery app *'
    puts "--------------------------------"
    while @running

      display_tasks
      action = gets.chomp.to_i
      route_action(action)
    end
  end

  private

  def display_tasks
    puts "What do you want to do ?"
    puts ""
    puts "1 - Display the menu"
    puts "2 - Add a meal to the menu"
    puts "3 - List all your customers"
    puts "4 - Add a customer"
    puts "5 - List orders"
    puts "6 - Take an order"
    puts "7 - Exit"
    puts "---------------------------"
  end

  def route_action(action)
    case action
      when 1 then @meals_controller.list
      when 2 then @meals_controller.add
      when 3 then @customers_controller.list
      when 4 then @customers_controller.add
      when 5 then @orders_controller.list
      when 6 then @orders_controller.add
      when 7 then stop
    end
  end

  def stop
    @running = false
  end
end
