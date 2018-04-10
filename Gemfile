source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Core
gem 'rails', '~> 5.1.4'

# Middleware
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'

# View/Front
gem 'webpacker'

# Backend
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'acts_as_list'
gem 'paperclip'

# Configration
gem 'config'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :test do
  gem 'database_cleaner'
  gem 'timecop'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
  gem 'rubocop'
  gem 'brakeman'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'rufo'
  gem 'rack-mini-profiler'
  gem 'letter_opener'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
