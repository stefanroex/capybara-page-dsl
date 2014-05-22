# CapybaraPageDSL

This is an extremely lightweight gem which adds a small layer atop off Capybara to increase reusablitiy. Instead of doing:

```ruby
  visit signup_path
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Password', with: 'password'
  click_button 'Sign up'
```

Your are able to define an page object:

```ruby
class SignupPage < CapybaraPageDSL::Page
  def visit
    page.visit signup_path
  end

  def fill_form(email:, password:)
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign up'
  end
end
```

And use them in the features:

```ruby
signup_page do |p|
  p.visit
  p.fill_form email: 'user@example.com', password: 'password'
end
```

## Installation

Add this line to your application's Gemfile:

    gem 'capybara-page-dsl', group: :test, require: false

## Usage

Add the following code to your `spec_helper` to require CapybaraPageDSL, load the page objects and inject the spec helpers.

``` ruby
require 'capybara-page-dsl'

Dir[Rails.root.join("spec/features/pages/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include CapybaraPageDSL::Helpers, type: :feature
end
```

You're now able to define the page objects in `spec/features/pages` and use the spec helpers. When you define an object called `UserPage`, you are able to access it by calling `user_page` in the feature.

## Contributing

1. Fork it ( https://github.com/stefan-roex/capybara-page-dsl/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
