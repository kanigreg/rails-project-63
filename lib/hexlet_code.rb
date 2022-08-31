# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Form, 'hexlet_code/form.rb'
  autoload :Input, 'hexlet_code/fields/input.rb'
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :Text, 'hexlet_code/fields/text.rb'

  class Error < StandardError; end

  def self.form_for(object, options = {})
    form_options = {
      action: options[:url] || '#',
      method: 'post'
    }

    form = Form.new(object, form_options)
    yield form if block_given?
    form.to_s
  end
end
