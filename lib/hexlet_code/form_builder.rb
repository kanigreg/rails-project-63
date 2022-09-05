# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(associated_object, form_options = {})
      @object = associated_object
      @options = form_options
      @components = []
    end

    def render
      yield(self) if block_given?
      HexletCode::Tag.build('form', @options) { @components.map(&:render).join }
    end

    def input(attribute_name, options = {})
      input_type = options[:as] || :string
      options = options.reject { |key| key == :as }
      options[:name] = attribute_name
      options[:value] = @object.public_send(attribute_name)

      input_class_name = "#{input_type.to_s.capitalize}Input"
      input = HexletCode::Inputs.const_get(input_class_name).new(options)
      @components << HexletCode::Wrapper.new(input)
    end

    def submit(name = 'Save', options = {})
      options = options.dup
      options[:value] = name
      options[:name] = :commit
      options[:type] = :submit
      input = HexletCode::Inputs::StringInput.new(options)
      @components << input
    end
  end
end
