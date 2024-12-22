# frozen_string_literal: true

module HexletCode # rubocop:disable Style/Documentation
  def self.form_for(_user, attributes = {})
    attrs = { action: nil, method: "post" }
    attrs[:action] = attributes.delete(:url) || "#"
    attrs.merge!(attributes)

    Tag.build("form", attrs)
  end
end
