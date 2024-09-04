# frozen_string_literal: true

Dir[Rails.root.join("lib/simple_navigation/renderer/*.rb")].sort.each { |file| require file }

module SimpleNavigation
  class RegisterRenderer
    def self.load
      SimpleNavigation.register_renderer tailwind_breadcrumb: SimpleNavigation::Renderer::TailwindBreadcrumb
      SimpleNavigation.register_renderer tailwind_navbar: SimpleNavigation::Renderer::TailwindNavbar
      SimpleNavigation.register_renderer tailwind_sidebar: SimpleNavigation::Renderer::TailwindSidebar
    end
  end
end
