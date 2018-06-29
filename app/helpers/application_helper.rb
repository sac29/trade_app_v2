module ApplicationHelper

  def current_user
    if session.has_key?(:user)
      user_id = session[:user]['id']
      @current_user ||= User.find_by(id: user_id)
    end
  end

end
