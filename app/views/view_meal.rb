require_relative 'base_view.rb'

class ViewMeal < BaseView
  def ask_user_for_infos
    attributes = {}
    puts "What's the meal name ?"
    puts "> "
    attributes[:name] = gets.chomp
    puts "How much does it cost ?"
    puts "> "
    attributes[:price] = gets.chomp.to_i
    return attributes
  end
end
