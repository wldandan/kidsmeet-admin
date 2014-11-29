class PasswordsController < Devise::PasswordsController
  skip_before_filter :require_login
end