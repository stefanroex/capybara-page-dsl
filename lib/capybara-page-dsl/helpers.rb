module CapybaraPageDSL
  module Helpers
    Page.registered_pages.each do |page_class|
      module_eval %Q{
        def #{page_class.helper_name}(&block)
          @#{page_class.helper_name} ||= #{page_class}.new
          if block_given?
            block.call(@#{page_class.helper_name})
          else
            @#{page_class.helper_name}
          end
        end
      }
    end
  end
end
