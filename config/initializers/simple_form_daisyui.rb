# frozen_string_literal: true

# load extras lib
Dir[Rails.root.join("lib/components/**/*.rb")].sort.each { |f| require f }

# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Default class for buttons
  config.button_class = "btn btn-primary"

  # Define the default class of the input wrapper of the boolean input.
  config.boolean_label_class = ""

  # How the label text should be generated altogether with the required text.
  config.label_text = ->(label, required, _explicit_label) { "#{label} #{required}" }

  # Define the way to render check boxes / radio buttons with labels.
  config.boolean_style = :inline

  # You can wrap each item in a collection of radio/check boxes with a tag
  config.item_wrapper_tag = :div

  # Defines if the default input wrapper class should be included in radio
  # collection wrappers.
  config.include_default_input_wrapper_class = false

  # CSS class to add for error notification helper.
  config.error_notification_class = "alert alert-error"

  # Method used to tidy up errors. Specify any Rails Array method.
  # :first lists the first message for each field.
  # :to_sentence to list all errors for each field.
  config.error_method = :to_sentence

  # add validation classes to `input_field`
  config.input_field_error_class = "input-error"
  config.input_field_valid_class = "input-success"
  config.label_class = "fieldset-legend"

  # vertical forms
  #
  # vertical default_wrapper
  config.wrappers :vertical_form, tag: "fieldset", class: "fieldset" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "fieldset-legend", error_class: "text-error"
    b.use :input, class: "input w-full", error_class: "input-error", valid_class: "input-success"
    b.use :full_error, wrap_with: { tag: "p", class: "mt-2 text-error text-xs italic w-full" }
    b.wrapper tag: "label", class: "label hint" do |ba|
      ba.use :hint, wrap_with: { tag: "span", class: "label-text-alt" }
    end
  end

  config.wrappers :input_group, tag: "fieldset", class: "fieldset",
    error_class: "form-group-invalid" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "fieldset-legend", error_class: "text-error"
    b.wrapper :input_group_tag, tag: "div", class: "input-group" do |ba|
      ba.optional :prepend
      ba.use :input, class: "input w-full", error_class: "input-error", valid_class: "input-success"
      ba.optional :append
    end
    b.use :full_error, wrap_with: { tag: "p", class: "mt-2 text-error text-xs italic w-full" }
    b.use :hint, wrap_with: { tag: "span", class: "label-text-alt" }
  end

  config.wrappers :vertical_textarea, tag: "fieldset", class: "fieldset" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "fieldset-legend", error_class: "text-error"
    b.use :input, class: "textarea w-full", error_class: "textarea-error", valid_class: "textarea-success"
    b.use :full_error, wrap_with: { tag: "p", class: "mt-2 text-error text-xs italic" }
    b.wrapper tag: "label", class: "label hint" do |ba|
      ba.use :hint, wrap_with: { tag: "span", class: "label-text-alt" }
    end
  end

  # vertical input for select
  config.wrappers :vertical_select, tag: "fieldset", class: "fieldset" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :readonly
    b.use :label, class: "fieldset-legend", error_class: "text-error"
    b.use :input, class: "select w-full", error_class: "select-error", valid_class: "select-success"
    b.use :full_error, wrap_with: { tag: "p", class: "mt-2 text-error text-xs italic" }
    b.wrapper tag: "label", class: "label hint" do |ba|
      ba.use :hint, wrap_with: { tag: "span", class: "label-text-alt" }
    end
  end

  # vertical input for boolean (aka checkboxes)
  config.wrappers :vertical_boolean, tag: "fieldset", class: "fieldset", error_class: "" do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper tag: "label", class: "fieldset-label" do |ba|
      ba.use :input, class: "checkbox", error_class: "checkbox-error"
      ba.use :label, class: "label-text", error_class: "text-error"
    end
    b.use :hint, wrap_with: { tag: "p", class: "block text-xs italic" }
    b.use :full_error, wrap_with: { tag: "p", class: "block text-error text-xs italic" }
  end

  # toggle for boolean (aka checkboxes)
  config.wrappers :toggle_boolean, tag: "fieldset", class: "fieldset", error_class: "" do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper tag: "label", class: "fieldset-label" do |ba|
      ba.use :input, class: "toggle toggle-primary", error_class: "checkbox-error"
      ba.use :label, class: "label-text", error_class: "text-error"
    end
    b.use :hint, wrap_with: { tag: "p", class: "block text-xs italic" }
    b.use :full_error, wrap_with: { tag: "p", class: "block text-error text-xs italic" }
  end

  # vertical input for radio buttons and check boxes
  config.wrappers :vertical_collection, item_wrapper_class: "flex items-center",
    item_label_class: "my-1 ml-3 block text-sm font-medium", tag: "div", class: "my-4" do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :legend_tag, tag: "legend", class: "text-sm font-medium", error_class: "text-error" do |ba|
      ba.use :label_text
    end
    b.use :input, class: "input w-full", error_class: "text-error", valid_class: "input-success"
    b.use :full_error, wrap_with: { tag: "p", class: "block mt-2 text-error text-xs italic" }
    b.use :hint, wrap_with: { tag: "p", class: "mt-2 text-xs italic" }
  end

  # vertical file input
  config.wrappers :vertical_file, tag: "div", class: "" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label, class: "fieldset-legend", error_class: "text-error"
    b.use :input, class: "input w-full", error_class: "input-error", valid_class: "input-success"
    b.use :full_error, wrap_with: { tag: "p", class: "mt-2 text-error text-xs italic" }
    b.use :hint, wrap_with: { tag: "p", class: "mt-2 text-xs italic" }
  end

  # vertical multi select
  config.wrappers :vertical_multi_select, tag: "fieldset", class: "fieldset", error_class: "f",
    valid_class: "" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "fieldset-legend", error_class: "text-error"
    b.wrapper tag: "div", class: "inline-flex space-x-1" do |ba|
      ba.use :input, class: "select select-bordered", error_class: "select-error", valid_class: "select-success"
    end
    b.use :full_error, wrap_with: { tag: "p", class: "mt-2 text-error text-xs italic" }
    b.use :hint, wrap_with: { tag: "p", class: "mt-2 text-xs italic" }
  end

  # vertical range input
  config.wrappers :vertical_range, tag: "fieldset", class: "fieldset", error_class: "text-error",
    valid_class: "input-success" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :readonly
    b.optional :step
    b.use :label, class: "fieldset-legend", error_class: "text-error"
    b.wrapper tag: "div", class: "flex items-center h-5" do |ba|
      ba.use :input, class: "range", error_class: "range-error", valid_class: "range-success"
    end
    b.use :full_error, wrap_with: { tag: "p", class: "mt-2 text-error text-xs italic" }
    b.use :hint, wrap_with: { tag: "p", class: "mt-2 text-xs italic" }
  end

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :vertical_form

  # Custom wrappers for input types. This should be a hash containing an input
  # type as key and the wrapper that will be used for all inputs with specified type.
  config.wrapper_mappings = {
    boolean: :toggle_boolean,
    check_boxes: :vertical_collection,
    date: :vertical_multi_select,
    datetime: :vertical_multi_select,
    file: :vertical_file,
    radio_buttons: :vertical_collection,
    range: :vertical_range,
    time: :vertical_multi_select,
    select: :vertical_select,
    text: :vertical_textarea,
    selectize: :vertical_select,
    enum_radio_buttons: :vertical_collection,
    enum: :vertical_select
  }
end
