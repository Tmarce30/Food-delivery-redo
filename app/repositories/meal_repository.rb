require_relative 'base_repository'
require_relative '../models/meal.rb'

class MealRepository < BaseRepository

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:name] = row[:name]
    row[:price] = row[:price].to_i
    Meal.new(row)
  end
end
