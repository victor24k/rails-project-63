# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new(name: "rob", job: "hexlet", gender: "m")
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_generates_empty_form
    expected = '<form action="#" method="post"></form>'
    generated = HexletCode.form_for(@user)
    assert_equal(expected, generated)
  end

  def test_it_adds_class_attribute
    expected = '<form action="#" method="post" class="hexlet-form"></form>'
    generated = HexletCode.form_for(@user, class: "hexlet-form")
    assert_equal(expected, generated)
  end

  def test_it_adds_url_attribute
    expected = '<form action="/profile" method="post"></form>'
    generated = HexletCode.form_for(@user, url: "/profile")
    assert_equal(expected, generated)
  end

  def test_it_adds_multiple_attributes
    expected = '<form action="/profile" method="post" class="hexlet-form"></form>'
    generated = HexletCode.form_for(@user, url: "/profile", class: "hexlet-form")
    assert_equal(expected, generated)
  end

  # def test_it_generates_simple_form
  #   expected = read_fixture_file(__method__)
  #   generated = HexletCode.form_for(@user) do |f|
  #     f.input :name
  #     f.input :job
  #   end
  #   assert_equal(expected, generated)
  # end

  # def test_it_converts_input_to_textarea
  #   expected = read_fixture_file(__method__)
  #   generated = HexletCode.form_for(@user) do |f|
  #     f.input :name
  #     f.input :job, as: :text
  #   end
  #   assert_equal(expected, generated)
  # end

  # def test_that_form_field_may_have_attributes
  #   expected = read_fixture_file(__method__)
  #   generated = HexletCode.form_for(@user, url: "#") do |f|
  #     f.input :name, class: "user-input"
  #     f.input :job
  #   end
  #   assert_equal(expected, generated)
  # end

  # def test_that_form_fields_may_have_default_attributes
  #   expected = read_fixture_file(__method__)
  #   generated = HexletCode.form_for(@user) do |f|
  #     f.input :job, as: :text
  #   end
  #   assert_equal(expected, generated)
  # end

  # def test_that_default_form_field_attributes_may_be_overriden
  #   expected = read_fixture_file(__method__)
  #   generated = HexletCode.form_for(@user, url: "#") do |f|
  #     f.input :job, as: :text, rows: 50, cols: 50
  #   end
  #   assert_equal(expected, generated)
  # end
end
