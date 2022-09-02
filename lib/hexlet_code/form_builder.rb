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
      options = options.dup
      input_type = options.delete(:as) || :string
      options[:name] = attribute_name
      options[:value] = @object.public_send(attribute_name)

      input = map_type(input_type).new(options)
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

    class UnknownInputTypeException < StandardError
      def initialize(type = nil)
        super("unknown type: #{type}")
      end
    end

    private

    def map_type(name)
      case name.to_sym
      when :string
        HexletCode::Inputs::StringInput
      when :text
        HexletCode::Inputs::TextInput
      else
        raise UnknownInputTypeException, name
      end
    end
  end
end
