require 'csv'

class BaseRepository
  def initialize(csv_file)
    @elements = []
    @csv_file = csv_file
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    save_csv
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| id == element.id }
  end

  private

  def save_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << @elements.first.class.headers
      @elements.each do |element|
        csv << element.csv_row
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @elements << build_element(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end
end
