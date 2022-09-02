# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput
      DEFAULTS = {
        type: :text
      }.freeze

      attr_reader :options

      def initialize(options)
        @options = options.reverse_merge(DEFAULTS)
      end

      def render
        HexletCode::Tag.build('input', @options)
      end
    end
  end
end
