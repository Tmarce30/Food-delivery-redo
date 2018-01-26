class BaseView
  def display(elements)
    elements.each do |element|
      puts element.to_s
    end
  end

  def ask_user_for_input(label, is_num = false)
    puts "Please enter #{label}"
    if is_num
      response = gets.chomp.to_i
    else
      response = gets.chomp
    end
    return response
  end
end
