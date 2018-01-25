require_relative 'base_repository'
require_relative '../models/customer.rb'

class CustomerRepository < BaseRepository

  private

  def save_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name]
      row[:address] = row[:address]
      @customers << Customer.new(row)
    end
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end
end
