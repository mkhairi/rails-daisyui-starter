# frozen_string_literal: true

require Rails.root.join("lib/simple_navigation/register_renderer")

# custom path
# don’t put the navigation files anywhere inside the app folder (they will get autoloaded by rails – you would not want that)
SimpleNavigation.config_file_path = Rails.root.join("config/navigations").to_s

# lib/simple_navigation/*.rb
SimpleNavigation::RegisterRenderer.load
