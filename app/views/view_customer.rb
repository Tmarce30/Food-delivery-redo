class ViewCustomer
  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end

  def ask_user_for_name_and_address
    attributes = {}
    puts "What is the name of the customer ?"
    puts "> "
    attributes[:name] = gets.chomp
    puts "What is his address ?"
    puts "> "
    attributes[:address] = gets.chomp
    return attributes
  end
end
