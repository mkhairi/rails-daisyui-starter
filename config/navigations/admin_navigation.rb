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
    primary.dom_attributes = { id: "sidebar", class: "menu menu-compact flex flex-col p-0 px-1" }
    primary.item :dashboards, "dashboards", root_path, html: { icon: "layout-dashboard" }
    primary.item :announcements, "announcements", root_path, html: { icon: "speakerphone" }, highlights_on: %r{admins/announcements}
    primary.item :series, "plates", root_path, html: { icon: "color_swatch" }, highlights_on: %r{admins/plates}
    primary.item :bids, "bids", root_path, html: { icon: "gavel" }, highlights_on: %r{admins/auctions}

    primary.item :wallets, "wallets", "#", html: { icon: "wallet" } do |secondary|
      secondary.item :withdraws, "withdraws", root_path, html: { icon: "transition-top" }, highlights_on: %r{admins/withdraws}
      secondary.item :orders, "deposits", root_path, html: { icon: "transition-bottom" }, highlights_on: %r{admins/orders}
    end
  end
end
