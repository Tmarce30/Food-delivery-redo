class ViewMeal
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - #{meal.price}"
    end
  end

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
