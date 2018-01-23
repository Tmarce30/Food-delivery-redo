require_relative '../models/meal.rb'
require_relative '../repositories/meal_repository.rb'
require_relative '../views/view_meal.rb'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = ViewMeal.new
  end

  def list
    meals = @meal_repository.all
    @view.display(meals)
  end

  def add
    attributes = @view.ask_user_for_infos
    meal = Meal.new(attributes)
    @meal_repository.add(meal)
  end
end
