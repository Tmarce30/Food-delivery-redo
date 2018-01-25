class ViewOrder
  def display(orders)
    orders.each do |order|
      puts "#{order.id} - #{order.meal} | #{order.employee.username} |
        #{order.customer.name} - #{order.customer.address}"
    end
  end

  def ask_user_for_order_infos(meals, customers, employees)
    attributes = {}
    puts "Which customer made the order ?"
    puts "> "
    attributes[:customer] = gets.chomp.to_i
    puts "Which meal does he want ?"
    puts "> "
    attributes[:meal] = gets.chomp.to_i
    puts "Who took the order ?"
    puts "> "
    attributes[:employee] = gets.chomp.to_i
    return attributes
  end
end
