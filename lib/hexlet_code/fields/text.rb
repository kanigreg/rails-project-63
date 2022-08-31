# frozen_string_literal: true

class HexletCode::Text
  DEFAULTS = {
    cols: 20,
    rows: 40
  }.freeze

  def self.build(options = {})
    options = DEFAULTS.merge(options)

    value = options.delete(:value)
    HexletCode::Tag.build('textarea', options) { value }
  end
end
