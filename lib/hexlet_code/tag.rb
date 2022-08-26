# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLETON_TAGS = %w[br img input].freeze

    def self.build(tag, attributes = {})
      params = attributes.map { |key, value| "#{key}=\"#{value}\"" }
      open_tag = "<#{tag} #{params.join(' ')}>"
      block = yield if block_given?
      close_tag = "</#{tag}>"

      if SINGLETON_TAGS.include? tag
        open_tag
      else
        [open_tag, block, close_tag].join
      end
    end
  end
end
