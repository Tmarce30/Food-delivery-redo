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

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:name] = row[:name]
    row[:address] = row[:address]
    Customer.new(row)
  end
end
