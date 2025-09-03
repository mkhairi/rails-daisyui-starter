# frozen_string_literal: true

module IconsHelper
  def icon(name, text = nil, options = {})
    if text.is_a?(Hash)
      options = text
      text = nil
    end
    size = options.delete(:size) || "size-5"
    options.reverse_merge!({ class: size })
    options[:id] = nil
    options[:class] = options[:class]

    type = options.delete(:type) || "outline"

    tooltip = options.delete(:tooltip)
    icon = InlineSvg::TransformPipeline.generate_html_from(read_svg_icon(name.to_s, type), options).html_safe
    icon += content_tag(:span, text, class: "ms-1") if text.present?

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
  rescue Errno::ENOENT => e
    icon = icons_file.at_css("[id='icon-#{filename}']")
    icon.to_html.gsub!("symbol", "svg")
  end

  def icons_file
    file_path = Rails.root.join("public/icons.svg")
    svg_icons = File.read(file_path)
    Nokogiri::XML(svg_icons)
  end
end
