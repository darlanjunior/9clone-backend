source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'jbuilder', '~> 2.5'
gem 'trailblazer-rails'
gem 'dry-validation'
gem 'roar-jsonapi'
gem 'carrierwave'
gem 'devise_token_auth'
gem 'pundit'
# gem 'bcrypt', '~> 3.1.7'
gem 'rack-cors'

group :development, :test do
  gem 'rspec-rails'
  gem 'pry', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
