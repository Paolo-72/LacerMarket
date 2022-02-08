source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "~> 7.0.0"

gem "sprockets-rails"



gem "puma", "~> 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem 'jquery-rails'

gem "jbuilder"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

gem 'materialize-sass', '~> 1.0.0'

gem 'sass-rails'
#Gestione utenti e permessi
gem 'devise'
#Gestione immagini per Active Storage
gem "image_processing", ">= 1.2"
#Gestione impaginazione
gem 'pagy', '~> 5.9'
#Friendly Id 
gem 'friendly_id', '~> 5.4.0'
#Divisione ambiente di sviluppo da quello di produzione
gem 'dotenv-rails', groups: [:development, :test]
#Ambiente di pagamento Stripe
gem 'stripe'
#aasm sicurezza transazioni pagamenti
gem 'aasm'
#Storage su cloud S3
gem "aws-sdk-s3", require: false



group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "sqlite3", "~> 1.4"
    
  
  
end

#Gruppo gems Heroku
group :production do
  gem 'pg', '1.1'
  gem 'rails_12factor'
  
end

group :development do
  gem "web-console"

end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
