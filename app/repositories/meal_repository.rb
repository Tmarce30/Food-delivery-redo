require_relative 'base_repository'
require_relative '../models/meal.rb'

class MealRepository < BaseRepository

  private

  def save_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:name] = row[:name]
    row[:price] = row[:price].to_i
    Meal.new(row)
  end
end
