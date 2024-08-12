# frozen_string_literal: true

module IconsHelper
  def icon(name, text = nil, options = {})
    if text.is_a?(Hash)
      options = text
      text = nil
    end
    options.reverse_merge!({ class: "w-6 h-6" })
    options["id"] = nil
    options["class"] = options[:class]
    options["width"] = "24px"
    options["height"] = "24px"

    type = options.delete(:type) || "outline"

    tooltip = options.delete(:tooltip)
    icon = InlineSvg::TransformPipeline.generate_html_from(read_svg_icon(name.to_s, type), options)
    icon = icon.html_safe + content_tag(:span, text, class: "ms-1") if text.blank?

    return icon unless tooltip

    content_tag(:span, icon, class: "tooltip", data: { tip: tooltip })
  rescue StandardError
    tag.span(name.to_s.dasherize) + content_tag(:span, text, class: "ms-1")
  end

  private

  def icons_path(type = "outline")
    Rails.public_path.join("assets/icons/heroicons/#{type}")
  end

  def read_svg_icon(filename, type = "outline")
    File.read("#{icons_path(type)}/#{filename.dasherize}.svg")
  end
end
