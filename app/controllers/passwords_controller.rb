class PasswordsController < Devise::PasswordsController
  skip_before_filter :require_login

  def new
    self.resource = resource_class.new
  end
end