# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'
require 'minitest/power_assert'

def load_fixture(name)
  File.readlines("test/fixtures/#{name}").map(&:strip).join
end
