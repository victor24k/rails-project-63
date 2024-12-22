# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/form"

# Implementation of simple HTML forms generator.
module HexletCode
  autoload :Html, "hexlet_code/html"

  def self.form_for(data, attributes = {}, &add_children)
    ordered_attributes = { action: nil, method: "post" }
    ordered_attributes[:action] = attributes.delete(:url) || "#"
    ordered_attributes.merge!(attributes)

    form = Form.new(data, ordered_attributes)
    add_children&.call(form)

    form
  end
end
