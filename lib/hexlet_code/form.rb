# frozen_string_literal: true

require 'active_support/inflector'

class HexletCode::Form
  attr_reader :object

  def initialize(associated_object, options = {})
    @object = associated_object
    @options = options
  end

  def buffer
    @buffer ||= []
  end

  def input(attribute_name, as: :input, **options)
    options[:name] = attribute_name
    options[:value] = object.public_send(attribute_name)

    field_type = "hexlet_code/#{as}".camelize.constantize
    buffer << field_type.build(options)
  end

  def submit; end

  def to_s
    HexletCode::Tag.build('form', @options) { buffer.join }
  end
end
