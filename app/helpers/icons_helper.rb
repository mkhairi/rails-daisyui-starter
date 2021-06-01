# frozen_string_literal: true

module IconsHelper
  def icon(name, options = {})
    options.reverse_merge!({ class: '' })
    options[:class] += 'inline-block stroke-current'
    svg = icons_file.at_css("[name='#{name}']")
    svg['class'] = options[:class]
    svg.to_html.gsub('symbol', 'svg').html_safe
  end

  private

  def icons_file
    file_path = Rails.root.join('public', 'icons.svg')
    Rails.cache.fetch("icons") do
      return Nokogiri::XML(File.read(file_path))
    end
  end
end
