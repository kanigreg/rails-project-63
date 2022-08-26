# frozen_string_literal: true

require 'test_helper'

class TestTag < Minitest::Test
  def test_singleton_tag_builder
    img_tag = HexletCode::Tag.build('img', src: 'cat.png')
    expected_tag = '<img src="cat.png">'

    assert img_tag == expected_tag
  end

  def test_builder
    label_tag = HexletCode::Tag.build('label', for: 'email') { 'Email' }
    expected_tag = '<label for="email">Email</label>'

    assert label_tag == expected_tag
  end
end
