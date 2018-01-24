class EmployeeRepository
  def initialize(csv_file)
    @employees = []
    @csv_file = csv_file
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all_delivery_guys
    @employees.select { |employee| employee.role == "delivery_guy" }
  end

  def find(id)
    @employees.find { |employee| id == employee.id }
  end

  def find_by_username(username)
    @employees.find { |employee| username == employee.username}
  end

  private

  def load_csv
    def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:username] = row[:username]
      row[:password] = row[:password]
      row[:role] = row[:role]
      @employees << Employee.new(row)
    end
    @next_id = @employees.empty? ? 1 : @employees.last.id + 1
  end
  end
end
