source 'https://rubygems.org'

ruby '3.2.2'

# Rails framework gem
gem 'rails', '~> 7.1.3'

# Database gem (PostgreSQL)
gem 'pg', '~> 1.1'

# Web server (Puma)
gem 'puma', '>= 5.0'

# JavaScript management
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'

# JSON API builder
gem 'jbuilder'

# Development and testing gems
group :development, :test do
  gem 'debug', platforms: %i[mri windows], require: false # Debugging
end

group :development do
  gem 'web-console' # Debugging tool
end

group :test do
  gem 'capybara' # Integration testing
  gem 'selenium-webdriver' # WebDriver for browser automation
end

# Additional gem for PDF generation
gem 'prawn', '~> 2.4'
