# frozen_string_literal: true

module SimpleNavigation
  class ItemContainer
    attr_accessor :dropdown
  end

  module Renderer
    class TailwindSidebar < SimpleNavigation::Renderer::Base
      def render(item_container)
        return "" if respond_to?(:skip_if_empty?) && skip_if_empty? && item_container.empty?

        SimpleNavigation.config.selected_class = "active"
        list_content = item_container.items.inject([]) do |list, item|
          li_options = item.html_options
          dropdown = item_container.dropdown.nil? ? true : item_container.dropdown
          dropdown = (include_sub_navigation?(item) && li_options.delete(:dropdown)) if li_options.include?(:dropdown)
          dropdown_list = li_options[:class] =~ /dropdown-item/
          if li_options[:class].nil?
            li_options[:class] = []
            li_options[:class] << "nav-item"
          end

          li_options[:class] = [] if dropdown_list
          li_content = tag_for(item, item.name, li_options, dropdown, dropdown_list)
          to_skip = false
          if include_sub_navigation?(item)
            li_options[:class] = [ li_options[:class], dropdown ? "dropdown" : nil ]
            shown = " show" if (li_options[:class] && %w[active dropdown]).length == 2
            sub_dom_class = [ item.sub_navigation.dom_class, dropdown ? "dropdown-menu" : nil, shown ]
            item.sub_navigation.dom_class = sub_dom_class.flatten.compact.join(" ")
            sub_content = render_sub_navigation_for(item)
            to_skip = true if respond_to?(:skip_if_empty?) && skip_if_empty? && sub_content.blank?
            li_content << sub_content

            li_options[:class] << shown
            li_options[:class] = li_options[:class].flatten.compact.join(" ")
          end
          list << if to_skip
            ""
          elsif include_sub_navigation?(item)
            shown = item.selected? ? "open" : "close"
            content_tag(:li, content_tag(:details, li_content, shown => ""), li_options)
          else
            content_tag(:li, li_content, li_options)
          end
        end.join

        dom_attributes = item_container.dom_attributes
        content_tag(:ul, list_content, dom_attributes)
      end

      protected

      def tag_for(item, name = "", li_options = nil, dropdown = false, dropdown_list = false)
        return item.name unless item.url || include_sub_navigation?(item)

        url = item.url
        icon = li_options.delete(:icon)
        link = []
        link << ApplicationController.helpers.icon(icon) if icon.present?
        link << content_tag(:span, name)
        item_link_html_opts = item.link_html_options || {}
        if item_link_html_opts[:class].nil?
          item_link_html_opts[:class] = []
          item_link_html_opts[:class] << (dropdown_list ? "dropdown-item" : "nav-link group")
        end

        if include_sub_navigation?(item)
          content_tag(:summary, link.join(" ").html_safe)
        else
          item.instance_variable_set(:@link_html_options, item_link_html_opts)
          link_to(link.join(" ").html_safe, url, options_for(item))
        end
      end
    end
  end
end

SimpleNavigation.register_renderer tailwind_sidebar: SimpleNavigation::Renderer::TailwindSidebar
