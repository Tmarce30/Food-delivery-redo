class ViewEmployee
  def display(employees)
    employees.each do |employee|
      puts "#{employee.username} - #{employee.role}"
    end
  end
end
