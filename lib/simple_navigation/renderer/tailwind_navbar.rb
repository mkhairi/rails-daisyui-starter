# frozen_string_literal: true

module SimpleNavigation
  class ItemContainer
    attr_accessor :dropdown, :split
  end

  module Renderer
    class TailwindNavbar < SimpleNavigation::Renderer::Base
      def render(item_container)
        if respond_to?(:skip_if_empty?) && skip_if_empty? && item_container.empty?
          return ""
        end

        config_selected_class = SimpleNavigation.config.selected_class
        SimpleNavigation.config.selected_class = "active"
        list_content = item_container.items.inject([]) do |list, item|
          # li_options = item.html_options.reject {|k, v| k == :link}
          li_options = item.html_options
          icon = li_options.delete(:icon)
          dropdown = item_container.dropdown.nil? ? true : item_container.dropdown
          split = item_container.split
          if li_options.include?(:split)
            split = (include_sub_navigation?(item) && li_options.delete(:split))
          end
          if li_options.include?(:dropdown)
            dropdown = (include_sub_navigation?(item) && li_options.delete(:dropdown))
          end
          if li_options[:class].nil?
            li_options[:class] = []
            li_options[:class] << " nav-item"
          end
          li_content = tag_for(item, item.name, icon, split, dropdown)
          to_skip = false
          if include_sub_navigation?(item)
            if split
              lio = li_options.dup
              lio[:class] = [ li_options[:class], "dropdown-split-left" ].flatten.compact.join(" ")
              list << content_tag(:li, li_content, lio)
              item.html_options[:link] = nil
              li_options[:id] = nil
              li_content = tag_for(item)
            end
            item.sub_navigation.dom_class = [ item.sub_navigation.dom_class, dropdown ? "dropdown-menu" : nil, split ? "float-right" : nil ].flatten.compact.join(" ")
            sub_content = render_sub_navigation_for(item)
            if respond_to?(:skip_if_empty?) && skip_if_empty? && sub_content.blank?
              to_skip = true
            end
            li_content << sub_content
            li_options[:class] = [ li_options[:class], dropdown ? "dropdown" : nil, split ? "dropdown-split-right" : nil ].flatten.compact.join(" ")
          end
          list << if to_skip
                    ""
          else
                    content_tag(:li, li_content, li_options)
          end
        end.join
        SimpleNavigation.config.selected_class = config_selected_class
        if item_container.respond_to?(:dom_attributes)
          dom_attributes = item_container.dom_attributes
        else
          # supports simple-navigation before the ItemContainer#dom_attributes
          dom_attributes = { id: item_container.dom_id, class: item_container.dom_class }
        end
        content_tag(:ul, list_content, dom_attributes)
      end

      protected

      def tag_for(item, name = "", icon = nil, split = false, dropdown = false)
        return item.name unless item.url || include_sub_navigation?(item)

        url = item.url
        link = []
        if icon.present?
          # link << content_tag(:i, nil, class: "menu-icon fe fe-#{icon}") unless icon.nil?
          unless icon.nil?
            link << content_tag(:i, [ icon ].flatten.compact.join(" "), class: "menu-icon icon mi")
          end
          link << content_tag(:span, name)
        else
          link << name
        end

        item_link_html_opts = item.link_html_options || {}

        if item_link_html_opts[:class].nil?
          item_link_html_opts[:class] = []
          item_link_html_opts[:class] << " nav-link waves-attach waves-effect"
        end

        if include_sub_navigation?(item)
          unless split
            if dropdown
              item_link_html_opts[:'data-toggle'] = "dropdown"
              item_link_html_opts[:'data-target'] = "#"
            end
            # link << content_tag(:b, '', :class => 'caret')
          end
        end
        item.instance_variable_set(:'@link_html_options', item_link_html_opts)
        link_to(link.join(" ").html_safe, url, options_for(item))
      end
    end
  end
end

SimpleNavigation.register_renderer tailwind_navbar: SimpleNavigation::Renderer::TailwindNavbar
