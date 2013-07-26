module Cucumber
  module Web
    module URLs
      def url_for(*names)
        Capybara.app.url_for(*names)
      end
      alias_method :url, :url_for

      def absolute_url_for(*names)
        "http://www.example.com" + Capybara.app.url_for(*names)
      end
      alias_method :absolute_url, :absolute_url_for
    end
  end
end

World(Cucumber::Web::URLs)
