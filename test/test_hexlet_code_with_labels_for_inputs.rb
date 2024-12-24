# frozen_string_literal: true

require "test_helper"

class TestHexletCodeWithLabelsForInputs < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new job: "hexlet"
  end

  def test_it_generates_inputs_with_labels
    expected = read_fixture_file(__method__)
    generated = HexletCode.form_for(@user) do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal(expected, generated)
  end

  def test_it_overrides_default_text_for_submit_button
    expected = read_fixture_file(__method__)
    generated = HexletCode.form_for(@user, url: "#") do |f|
      f.input :name
      f.input :job
      f.submit "Wow"
    end
    assert_equal(expected, generated)
  end
end
