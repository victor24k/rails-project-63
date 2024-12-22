# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new(name: "rob", job: "unemployeed")
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_it_generates_empty_form
    generated = HexletCode.form_for(@user)
    expected = '<form action="#" method="post"></form>'
    assert_equal(expected, generated)
  end

  def test_it_adds_class_attribute
    generated = HexletCode.form_for(@user, class: "hexlet-form")
    expected = '<form action="#" method="post" class="hexlet-form"></form>'
    assert_equal(expected, generated)
  end

  def test_it_adds_url_attribute
    generated = HexletCode.form_for(@user, url: "/profile")
    expected = '<form action="/profile" method="post"></form>'
    assert_equal(expected, generated)
  end

  def test_it_adds_multiple_attributes
    generated = HexletCode.form_for(@user, url: "/profile", class: "hexlet-form")
    expected = '<form action="/profile" method="post" class="hexlet-form"></form>'
    assert_equal(expected, generated)
  end
end
