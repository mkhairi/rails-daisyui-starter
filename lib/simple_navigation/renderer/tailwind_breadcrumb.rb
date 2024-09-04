# frozen_string_literal: true

module SimpleNavigation
  module Renderer
    class TailwindBreadcrumb < SimpleNavigation::Renderer::Base
      def render(item_container)
        item_container.dom_class = "breadcrumb elevated-1 bg-white full-width pull-left"
        if skip_if_empty? && item_container.empty?
          ""
        else
          content_tag(:ol, li_tags(item_container).join, { id: item_container.dom_id, class: item_container.dom_class })
        end
      end

      protected

      def li_tags(item_container)
        item_container.items.each_with_object([]) do |item, list|
          next unless item.selected?

          icon_tag = content_tag(:i, "")
          if item_container.level.eql?(1)
            li_options = item.html_options.reject { |k, _v| k == :link }
            icon = li_options.delete(:icon)
            unless icon.nil?
              icon_tag = content_tag(:i, "", class: [ icon ].flatten.compact.join(" "))
            end
          end
          if include_sub_navigation?(item)
            if item.selected?
              list << content_tag(:li, link_to(icon_tag + content_tag(:span, item.name), item.url, { method: item.method }.merge(item.html_options.except(:icon, :class, :id))))
            end
            list.concat li_tags(item.sub_navigation)
          else
            if item.selected?
              list << content_tag(:li, link_to(icon_tag + content_tag(:span, item.name), "javascript:void(0)"), { class: "active" })
            end
          end
        end
      end
    end
  end
end
SimpleNavigation.register_renderer tailwind_breadcrumbs: SimpleNavigation::Renderer::TailwindBreadcrumb
