class ViewOrder
  def display(orders)
    orders.each do |order|
      puts "#{order.id} - #{order.meal} | #{order.employee.username} |
        #{order.customer.name} - #{order.customer.address}"
    end
  end
end
