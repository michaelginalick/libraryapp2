module ApplicationHelper

  def admin_user
    @admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def admin_logged_in?
    admin_user != nil
  end

  

end
