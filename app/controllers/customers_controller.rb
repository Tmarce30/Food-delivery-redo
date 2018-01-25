require_relative '../views/view_customer.rb'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = ViewCustomer.new
  end

  def list
    customers = @customer_repository.all
    @view.display(customers)
  end

  def add
    name = ask_for_input("the customer name")
    address = ask_for_input("the customer address")
    customer = Customer.new(name: name, address: address)
    @customer_repository.add(customer)
  end
end
