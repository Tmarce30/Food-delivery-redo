require_relative '../views/base_view.rb'

class ViewSession < BaseView
  def wrong_credentials
    puts 'Wrong credentials, try again'
  end

  def logged_in
    puts 'You are now logged in'
  end
end
