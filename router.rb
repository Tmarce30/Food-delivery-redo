# TODO: implement the router of your app.
class Router
  def initialize(customers_controller, meals_controller, orders_controller, sessions_controller)
    @customers_controller = customers_controller
    @meals_controller = meals_controller
    @orders_controller = orders_controller
    @sessions_controller = sessions_controller

    @running = true
  end

  def run
    puts '* Welcome to your delivery app *'
    puts "--------------------------------"
    while @running
      @employee = @sessions_controller.log_in
      while @running && @employee
        if @employee.manager?
          display_manager_tasks
          action = gets.chomp.to_i
          route_manager_action(action)
        elsif @employee.delivery_guy?
          display_delivery_guy_tasks
          action = gets.chomp.to_i
          route_employee_action(action)
        end
      end
      print `clear`
    end
  end

  private

  def display_manager_tasks
    puts "What do you want to do ?"
    puts ""
    puts "1 - Display the menu"
    puts "2 - Add a meal to the menu"
    puts "3 - List all your customers"
    puts "4 - Add a customer"
    puts "5 - List orders"
    puts "6 - Sign out"
    puts "7 - Exit"
    puts "---------------------------"
  end

  def route_manager_action(action)
    case action
      when 1 then @meals_controller.list
      when 2 then @meals_controller.add
      when 3 then @customers_controller.list
      when 4 then @customers_controller.add
      when 5 then @orders_controller.list_undelivered_orders
      when 6 then @employee = nil
      when 7 then stop
      else
        puts 'Enter a number between 1 and 6 !'
    end
  end

  def display_delivery_guy_tasks
    puts "What do you want to do ?"
    puts ""
    puts "1 - Take an order"
    puts "2 - List my orders"
    puts "3 - Mark order as delivered"
    puts "4 - Sign out"
    puts "5 - Exit"
    puts "---------------------------"
  end

  def route_employee_action(action)
    case action
      when 1 then @orders_controller.add
      when 2 then @orders_controller.list_my_orders(@employee)
      when 3 then @orders_controller.mark_as_delivered(@employee)
      when 4 then @employee = nil
      when 5 then stop
      else
        puts 'Enter a number between 1 and 4 !'
    end
  end


  def stop
    @running = false
    @employee = nil
  end
end
