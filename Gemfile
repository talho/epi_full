source 'https://rubygems.org'
gem 'rails', '3.2.11'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "mongoid", ">= 3.0.19"
gem "devise", ">= 2.2.3"
gem "figaro", ">= 0.5.3"
gem "httparty"

group :development do
  gem "quiet_assets", ">= 1.0.1"
  gem "better_errors", ">= 0.3.2"
  gem "binding_of_caller", ">= 0.6.8"
  gem "capistrano"
  gem 'rvm-capistrano'
  gem 'capistrano-unicorn'
end

gem "rspec-rails", ">= 2.12.2", :group => [:development, :test]
gem "debugger", :group => [:development, :test]

group :test do
  gem "database_cleaner", ">= 0.9.1"
  gem "mongoid-rspec", ">= 1.6.0"
  gem "email_spec", ">= 1.4.0"
  gem "cucumber-rails", ">= 1.3.0", :require => false
  gem "launchy", ">= 2.1.2"
  gem "capybara", ">= 2.0.2"
  gem "factory_girl_rails", ">= 4.2.0"
end

group :production do
  gem "unicorn", ">= 4.3.1"
end
