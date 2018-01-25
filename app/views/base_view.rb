class BaseView
  def display(elements)
    elements.each do |element|
      puts element.to_s
    end
  end

  def ask_for_input(label, is_num = false)
    puts "Please enter #{label}"
    response = gets.chomp
    if is_num
      response = gets.chomp.to_i
    end
    return response
  end
end
