module ApplicationHelper

  AVATARS = %w(cat.png  cow.png  donkey.png  frog.png  mouse.png
               panda.png  pig.png  sheep.png  tiger.png)

  def avatar_placeholder_url
    "avatar/#{AVATARS[rand(AVATARS.length)]}"
  end

  def current_user
      current_agent
  end

  def require_login
    redirect_to new_user_session_path unless signed_in? or params[:controller].include? "active_admin/devise"
  end

end
