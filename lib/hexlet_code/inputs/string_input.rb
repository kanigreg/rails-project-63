# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput
      DEFAULTS = {
        type: :text
      }.freeze

      def self.render(options = {})
        options = DEFAULTS.merge(options)

        HexletCode::Tag.build('input', options)
      end
    end
  end
end
