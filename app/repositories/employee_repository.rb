require_relative 'base_repository'
require_relative '../models/employee.rb'

class EmployeeRepository < BaseRepository
  undef_method :add

  def all_delivery_guys
    @elements.select { |element| element.delivery_guy? }
  end

  def find_by_username(username)
    @elements.find { |element| username == element.username}
  end

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:username] = row[:username]
    row[:password] = row[:password]
    row[:role] = row[:role]
    Employee.new(row)
  end
end
