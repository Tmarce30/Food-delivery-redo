require_relative 'base_view.rb'

class ViewOrder < BaseView
  def ask_user_for_order_infos(meals, customers, employees)
    attributes = {}
    puts "Which customer made the order ?"
    puts "> "
    attributes[:customer] = gets.chomp.to_i
    puts "Which meal does he want ?"
    puts "> "
    attributes[:meal] = gets.chomp.to_i
    puts "Who took the order ?"
    puts "> "
    attributes[:employee] = gets.chomp.to_i
    return attributes
  end

  def ask_user_for_id
    puts "Select delivered order"
    order = gets.chomp.to_i
    return order
  end
end
