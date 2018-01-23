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
end
