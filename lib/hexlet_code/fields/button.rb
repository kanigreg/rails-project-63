# frozen_string_literal: true

module HexletCode
  module Fields
    class Button
      def initialize(options = {})
        @options = options.dup
      end

      def render
        HexletCode::Tag.build('input', @options)
      end
    end
  end
end
