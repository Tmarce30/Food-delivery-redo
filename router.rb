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
    puts "3 - Remove a meal from the menu"
    puts "4 - List all my customers"
    puts "5 - Add a customer"
    puts "6 - Delete a customer"
    puts "7 - Take an order"
    puts "8 - List orders"
    puts "9 - Sign out"
    puts "10 - Exit"
    puts "---------------------------"
  end

  def route_manager_action(action)
    case action
      when 1 then @meals_controller.list
      when 2 then @meals_controller.add
      when 3 then @meals_controller.destroy
      when 4 then @customers_controller.list
      when 5 then @customers_controller.add
      when 6 then @customers_controller.destroy
      when 7 then @orders_controller.add
      when 8 then @orders_controller.list_undelivered_orders
      when 9 then @employee = nil
      when 10 then stop
      else
        puts 'Enter a number between 1 and 6 !'
    end
  end

  def display_delivery_guy_tasks
    puts "What do you want to do ?"
    puts ""
    puts "1 - List my orders"
    puts "2 - Mark order as delivered"
    puts "3 - Sign out"
    puts "4 - Exit"
    puts "---------------------------"
  end

  def route_employee_action(action)
    case action
      when 1 then @orders_controller.list_my_orders(@employee)
      when 2 then @orders_controller.mark_as_delivered(@employee)
      when 3 then @employee = nil
      when 4 then stop
      else
        puts 'Enter a number between 1 and 4 !'
    end
  end


  def stop
    @running = false
    @employee = nil
  end
end
