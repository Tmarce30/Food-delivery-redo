require_relative '../views/view_session.rb'

class SessionController
  def initialize
    @view = ViewSession.new
  end

  def sign_in
    username = @view.ask_user_for_input('Username', is_num = false)
    password = @view.ask_user_for_input('Password', is_num = false)
  end
end
