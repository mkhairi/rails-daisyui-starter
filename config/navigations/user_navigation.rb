# frozen_string_literal: true

# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.name_generator = proc { |name| I18n.t(name, scope: :simple_navigation, default: name).humanize }
  navigation.id_generator = proc { |key| "menu-#{key}" }
  # navigation.auto_highlight = false
  # navigation.highlight_on_subpath = true
  navigation.active_leaf_class = "simple-navigation-active-leaf"
  navigation.selected_class = "active"
  navigation.items do |primary|
    primary.dom_attributes = { id: "navbar", class: "menu menu-horizontal p-0 mr-auto text-white" }
    primary.item :plates, "Home", root_path
    primary.item :plates, "plates", root_path
    primary.item :bids, "bids", root_path
    primary.item :myplates, "my_plates", root_path
    primary.item :mybid, "my_bids", root_path
    primary.item :pages1, "faq", pages_path(:faq)
    primary.item :pages2, "contact_us", pages_path(:contact)
  end
end
