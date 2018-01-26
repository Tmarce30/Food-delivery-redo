require_relative 'app/repositories/customer_repository.rb'
require_relative 'app/repositories/employee_repository.rb'
require_relative 'app/repositories/meal_repository.rb'
require_relative 'app/repositories/order_repository.rb'

require_relative 'app/controllers/customers_controller.rb'
require_relative 'app/controllers/meals_controller.rb'
require_relative 'app/controllers/orders_controller.rb'

customer_csv_file = File.join(__dir__, 'data/customers.csv')
employee_csv_file = File.join(__dir__, 'data/employees.csv')
meal_csv_file = File.join(__dir__, 'data/meals.csv')
order_csv_file = File.join(__dir__, 'data/orders.csv')

customer_repository = CustomerRepository.new(customer_csv_file)
employee_repository = EmployeeRepository.new(employee_csv_file)
meal_repository = MealRepository.new(meal_csv_file)
order_repoitory = OrderRepository.new(order_csv_file, meal_repository, employee_repository, customer_repository)

