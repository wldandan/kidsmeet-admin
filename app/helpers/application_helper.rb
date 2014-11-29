module ApplicationHelper

  def current_user
      current_agent
  end

  def require_login
    redirect_to new_user_session_path unless signed_in? or params[:controller].include? "active_admin/devise"
  end

end
