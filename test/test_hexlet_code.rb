# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new name: 'rob'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_generation
    form = HexletCode.form_for @user
    expected = '<form action="#" method="post"></form>'

    assert { form == expected }
  end

  def test_form_generation_with_action
    form = HexletCode.form_for @user, url: '/users'
    expected = '<form action="/users" method="post"></form>'

    assert { form == expected }
  end
end
