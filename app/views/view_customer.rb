require_relative 'base_view.rb'

class ViewCustomer < BaseView
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
