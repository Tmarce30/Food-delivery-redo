class BaseView
  def display(elements)
    elements.each do |element|
      puts element.to_s
    end
  end
end
