# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'active_support/core_ext/hash/reverse_merge'

module HexletCode
  autoload :FormBuilder, 'hexlet_code/form_builder.rb'
  autoload :Inputs, 'hexlet_code/inputs.rb'
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :Wrapper, 'hexlet_code/wrapper.rb'

  class Error < StandardError; end

  def self.form_for(object, options = {}, &)
    form_options = {
      action: options[:url] || '#',
      method: 'post'
    }

    FormBuilder.new(object, form_options).render(&)
  end
end
