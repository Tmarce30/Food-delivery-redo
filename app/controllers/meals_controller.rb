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
    name = @view.ask_user_for_input("the meal's name")
    price = @view.ask_user_for_input("the meal's price", true)
    meal = Meal.new(name: name, price: price)
    @meal_repository.add(meal)
  end
end
