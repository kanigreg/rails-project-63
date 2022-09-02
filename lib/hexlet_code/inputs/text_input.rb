# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput
      DEFAULTS = {
        cols: 20,
        rows: 40
      }.freeze

      attr_reader :options

      def initialize(options)
        @options = options.reverse_merge(DEFAULTS)
        @value = @options.delete(:value)
      end

      def render
        HexletCode::Tag.build('textarea', @options) { @value }
      end
    end
  end
end
