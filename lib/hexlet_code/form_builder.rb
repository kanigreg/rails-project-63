# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(associated_object, form_options = {})
      @object = associated_object
      @form_options = form_options
      @component_options = []

      yield(self) if block_given?
    end

    def render
      tags = @component_options.map { |options| create_tag(options) }

      HexletCode::Tag.build('form', @form_options) { tags.map(&:render).join }
    end

    def input(attribute_name, options = {})
      options = options.dup
      options[:name] = attribute_name
      options[:value] = @object.public_send(attribute_name)

      @component_options << options
    end

    def submit(name = 'Save', options = {})
      options = options.dup
      options[:value] = name
      options[:name] = :commit
      options[:type] = :submit

      @component_options << options
    end

    def create_tag(options)
      input_type = options[:as] || :string
      attributes = options.reject { |key| key == :as }

      input_class_name = "#{input_type.to_s.capitalize}Input"
      input = HexletCode::Inputs.const_get(input_class_name).new(attributes)

      if options[:type] == :submit
        input
      else
        HexletCode::Wrapper.new(input)
      end
    end
  end
end
