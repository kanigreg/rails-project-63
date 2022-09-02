# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_default
    html = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    expected = load_fixture('default.html')

    assert { html == expected }
  end

  def test_form_generation_with_action
    html = HexletCode.form_for @user, url: '/users'
    expected = '<form action="/users" method="post"></form>'

    assert { html == expected }
  end

  def test_with_addition_attributes
    html = HexletCode.form_for @user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    expected = load_fixture('addtion_attributes.html')

    assert { html == expected }
  end

  def test_overwrite_default_attributes
    html = HexletCode.form_for @user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    expected = load_fixture('default_attributes.html')

    assert { html == expected }
  end

  def test_unexisted_field
    assert_raises NoMethodError do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :age
      end
    end
  end

  def test_submit_button_text
    html = HexletCode.form_for @user, url: '/users' do |f|
      f.submit 'Wow'
    end
    expected = '<form action="/users" method="post"><input type="submit" value="Wow" name="commit"></form>'

    assert { html == expected }
  end
end
