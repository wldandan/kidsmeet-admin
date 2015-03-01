source 'https://rubygems.org'
#source 'https://ruby.taobao.org'

# core
gem 'rails', '4.1.6'
gem 'mysql2'

# presentation
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'slim-rails'
gem 'font-awesome-rails'
gem 'bootstrap-sass'
gem 'bootstrap-sass-extras'

# application
gem 'rails_admin'
gem 'devise'
gem 'cancancan'
gem 'ckeditor'
gem 'kaminari', '~> 0.16.1'

#sidekiq
gem 'sinatra', require: false
gem 'sidekiq'

# Paperclip
gem 'paperclip','3.4.2'
gem 'paperclip-compression'
gem 'paperclip-qiniu'
gem 'paperclip-watermark', :github => 'vikewoods/paperclip-watermark'

group :development do
  gem 'annotate'
  gem 'spring'
end

group :development, :test do
  gem 'byebug'
  gem 'simplecov'
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'letter_opener'
end

group :test do
  gem 'database_rewinder'
  gem 'turnip'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'poltergeist'
  gem 'email_spec'
end
