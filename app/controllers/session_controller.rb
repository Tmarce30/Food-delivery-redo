require_relative '../views/view_session.rb'

class SessionController
  def initialize
    @view = ViewSession.new
  end
end
