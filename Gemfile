source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'


gem 'sequel-rails'
gem 'devise', '~> 4.5'
gem 'sequel'
gem 'sequel-devise', '~> 0.0.13'

gem 'slim-rails', '~> 3.1', '>= 3.1.3'

gem 'sequel_enum', '~> 0.1.1'
gem 'rubocop', '~> 0.59.2'
gem 'faker', '~> 1.9', '>= 1.9.1'

gem 'dry-validation', '~> 0.12.2'
gem 'dry-initializer', '~> 2.5'

gem 'sequel-elasticsearch', '~> 0.4.3'


# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 4.11', '>= 4.11.1'
  # gem 'rspec-rails', '~> 3.8'
  gem 'rspec', '~> 3.8'
  gem 'database_cleaner', '~> 1.7'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
