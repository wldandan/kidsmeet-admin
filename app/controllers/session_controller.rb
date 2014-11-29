class SessionsController < Devise::SessionsController

  #layout "signed_out"

  include Authenticate

  skip_before_filter :require_login, only: [:new, :create]

  def new

  end

end
