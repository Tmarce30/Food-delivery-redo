require_relative 'base_repository'
require_relative '../models/customer.rb'

class CustomerRepository < BaseRepository

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:name] = row[:name]
    row[:address] = row[:address]
    Customer.new(row)
  end
end
