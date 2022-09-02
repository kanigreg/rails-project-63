# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput
      DEFAULTS = {
        cols: 20,
        rows: 40
      }.freeze

      def self.render(options = {})
        options = DEFAULTS.merge(options)

        value = options.delete(:value)
        HexletCode::Tag.build('textarea', options) { value }
      end
    end
  end
end
