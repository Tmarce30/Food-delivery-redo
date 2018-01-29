require_relative '../views/view_session.rb'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = ViewSession.new
  end

  def log_in
    username = @view.ask_user_for_input('Username', is_num = false)
    password = @view.ask_user_for_input('Password', is_num = false)

    employee = @employee_repository.find_by_username(username)

    if employee && employee.password == password
      @view.logged_in
      return employee
    else
      @view.wrong_credentials
      log_in
    end
  end
end
