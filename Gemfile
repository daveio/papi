# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2', '>= 5.2.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.3.6'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.4', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS),
# making cross-origin AJAX possible
gem 'rack-cors', '~> 1.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get
  # a debugger console
  gem 'byebug', '~> 11.0', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', '~> 0.67.2'
  gem 'rubocop-performance', '~> 1.1'
  gem 'rubocop-rspec', '~> 1.32'
end

group :development do
  gem 'listen', '~> 3.1'
  # https://github.com/rails/spring
  gem 'colorls', '~> 1.2'
  gem 'pry-rails', '~> 0.3.9'
  gem 'solargraph', '~> 0.32.1'
  gem 'spring', '~> 2.0'
  gem 'spring-watcher-listen', '~> 2.0'
end

gem 'dotenv-rails', '~> 2.7.2'
gem 'foreman', '~> 0.85.0'
gem 'rest-client', '~> 2.0'
gem 'todoist-ruby', '~> 0.2.2'
gem 'tzinfo-data', '~> 1.2019'
