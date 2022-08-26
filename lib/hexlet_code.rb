# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'

  class Error < StandardError; end

  def self.form_for(_obj, options = {})
    form_options = {
      action: options[:url] || '#',
      method: 'post'
    }

    Tag.build('form', form_options)
  end
end
