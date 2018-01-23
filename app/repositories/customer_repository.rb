class CustomerRepository
  def initialize(csv_file)
    @customers = []
    @csv_file = csv_file
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name]
      row[:address] = row[:address]
      @customers << Customer.new(row)
    end
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end
end
