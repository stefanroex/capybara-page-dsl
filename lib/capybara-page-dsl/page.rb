module CapybaraPageDSL
  class Page
    include Capybara::DSL
    include RSpec::Matchers
    include Rails.application.routes.url_helpers

    cattr_reader :registered_pages
    @@registered_pages = []

    def self.inherited(klass)
      @@registered_pages << klass
    end

    def self.helper_name
      to_s.underscore
    end
  end
end
