# frozen_string_literal: true

class TinymceInput < SimpleForm::Inputs::Base
  enable :placeholder, :maxlength, :minlength

  def input(wrapper_options = nil)
    options[:wrapper_html] ||= {}
    options[:wrapper_html][:data] = { controller: :tinymce }
    input_html_options[:data] = { tinymce_target: "input" }
    input_html_options[:class] = "tinymce"
    input_html_options[:rows] ||= 20
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    @builder.text_area(attribute_name, merged_input_options)
  end
end
