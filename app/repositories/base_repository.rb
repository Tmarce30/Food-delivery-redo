class BaseRepository
  def initialize(csv_file)
    @elements = []
    @csv_file = csv_file
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end
end
