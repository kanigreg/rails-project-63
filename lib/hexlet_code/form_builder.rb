# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(associated_object, form_options = {})
      @object = associated_object
      @options = form_options
      @rendered_components = []
    end

    def render
      yield(self) if block_given?
      HexletCode::Tag.build('form', @options) { @rendered_components.join }
    end

    def input(attribute_name, options = {})
      options = options.dup
      input_type = options.delete(:as) || :string
      options[:name] = attribute_name
      options[:value] = @object.public_send(attribute_name)

      @rendered_components << map_type(input_type).render(options)
    end

    def submit; end

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
