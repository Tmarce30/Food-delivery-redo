require 'csv'
require_relative '../models/order.rb'

class OrderRepository
  def initialize(csv_file, meal_repository, employee_repository, customer_repository)
    @orders = []
    @csv_file = csv_file
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def undelivered_orders
    @orders.select { |order| order.delivered == false }
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end

  def add(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save_csv
  end

  def save_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << ["id", "delivered", "meal_id", "employee_id", "customer_id"]
      @orders.each do |order|
        csv << [order.id, order.delivered, order.meal.id, order.employee.id, order.customer.id]
      end
    end
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      @orders << Order.new(row)
    end
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end
end
