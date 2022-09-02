# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :FormBuilder, 'hexlet_code/form_builder.rb'
  autoload :Inputs, 'hexlet_code/inputs.rb'
  autoload :Tag, 'hexlet_code/tag.rb'

  class Error < StandardError; end

  def self.form_for(object, options = {}, &block)
    form_options = {
      action: options[:url] || '#',
      method: 'post'
    }

    FormBuilder.new(object, form_options).render(&block)
  end
end
