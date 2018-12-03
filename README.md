# Rails
Create a new git repo.</br>

Create a new Rails app without a database:
```
rails new myapp --skip-activerecord
```

## Adding RSpec and Jenkins for Automated Testing
Add to the `Gemfile` into the group :development, :test do:
```
# TDD testing
gem 'rspec-rails'
```
Install the gem:
```
bundle install
```
Generate the RSpec configuration:
```
rails generate rspec:install
```
Ensure the correct version of RSpec is used:
```
bundle binstubs rspec-core
```

Create a new folder `spec/features` and a new file inside it `user_todolist_spec.rb`.</br>
Add the following to this file:
```
require 'rails_helper'

RSpec.feature "Creating Home Page" do
  scenario do
    visit '/'

    expect(page).to have_content('Home')

  end
end
```
Add username and password for the database in `config/database.yml`:
```
default: &default
  ...
  username: postgres
  password: postgres
  ...
```
Create the databases:
```
rails db:create
```
Commit to Git.</br>

## Add simplecov for code coverage reports
Add to `gemfile`:
```
group :test do
  # Code coverage
  gem 'simplecov', require: false
end
```
Add to `.gitignore`:
```
#I gnore coverage files
coverage/*
```
At the top of `spec/spec_helper.rb`:
```
require 'simplecov'
SimpleCov.start 'rails' do
  # These filters are excluded from results
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
  add_filter '/test/'
  add_filter do |source_file|
    source_file.lines.count < 10
  end
end
```
Now when you run RSpec you will see the code coverage and generate a report in the coverage folder.</br>
Add Brakeman to the `Gemfile`:
```
group :development do
  ...
  # Static security vulnerability analysis
  gem 'brakeman'
end
```
Run:
```
bundle install
```
Run Brakeman report:
```
brakeman
```
