# frozen_string_literal: true

module HexletCode
  class Wrapper
    attr_reader :input

    def initialize(input)
      @input = input
    end

    def render
      attribute_name = input.options[:name]
      label = HexletCode::Tag.build('label', for: attribute_name) { attribute_name.capitalize }
      [label, @input.render].join
    end
  end
end
