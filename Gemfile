source 'https://rubygems.org'

ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use RubySlim for .slim assets and views
gem 'slim-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

######## EDITOR
gem 'tinymce-rails'
gem 'tinymce-rails-imageupload', '~> 4.0.0.beta'

gem 'puma'

gem 'devise'

gem 'friendly_id', '~> 5.1.0'

########## PRY
gem 'pry'
gem 'pry-rails'

########## AWS e Paperclip
gem 'aws-sdk', '~> 1.37'
gem 'paperclip'

########## DEFAULT VALUES
gem 'default_value_for'

########## Pagination
gem 'kaminari'

########## SEARCH
gem 'searchkick'

group :development do
  gem 'rails-erd'
  gem 'better_errors'
  gem 'binding_of_caller'

  ########## FRONTEND
  ################# GUARD LIVERELOAD
  gem "guard", ">= 2.2.2",       :require => false
  gem "guard-livereload",        :require => false
  gem "rack-livereload"
  gem "rb-fsevent",              :require => false
  ################# GUARD LIVERELOAD

  gem 'rubocop', require: false
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  #### TESTING
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "capybara"
  gem "selenium-webdriver"
  gem 'faker'

  gem 'railroady'
end

group :test do
  gem 'shoulda-matchers', '3.0.0.rc1'
  gem "database_cleaner"
  gem 'guard-rspec'
  gem 'zeus'
end

##### FRONTEND

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Materialize
gem 'materialize-sass'
