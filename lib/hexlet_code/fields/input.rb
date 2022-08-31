# frozen_string_literal: true

class HexletCode::Input
  DEFAULTS = {
    type: :text
  }.freeze

  def self.build(options = {})
    options = DEFAULTS.merge(options)

    HexletCode::Tag.build('input', options)
  end
end
