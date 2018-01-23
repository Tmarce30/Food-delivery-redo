require_relative '../models/customer.rb'
require_relative '../repositories/customer_repository.rb'
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
    attributes = @view.ask_user_for_name_and_address
    customer = Customer.new(attributes)
    @customer_repository.add(customer)
  end
end
