source 'https://rubygems.org'

ruby '2.1.5'
gem 'rails', '4.1.8'

# Use postgresql as the database for Active Record
gem 'pg'
gem 'active_model_serializers', '0.8.1' # explicitly set due to breaking changes until 0.10 is released

# Assets
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'ember-rails'
gem 'bootstrap-sass'

# Javascript libs
gem 'jquery-rails'
gem 'ember-source', '~>1.8.0'
# Other libraries including ember-data are managed using bower, see /vendor/assets/javascripts

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails'
  gem 'pry'
end

group :development do
  gem 'coffee-rails-source-maps', group: :development
  gem 'spring'
  gem 'annotate'
end

group :production do
  gem 'rails_12factor'
end


