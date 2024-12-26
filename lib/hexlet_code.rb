# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/form'

# Simple HTML forms generator.
module HexletCode
  autoload :Html, 'hexlet_code/html'

  def self.form_for(data, attributes = {}, &populate_children)
    ordered_attributes = { action: nil, method: 'post' }
    ordered_attributes[:action] = attributes.delete(:url) || '#'
    ordered_attributes.merge!(attributes)

    form = Form.new(data, ordered_attributes)
    populate_children&.call(form)

    form.to_s
  end
end
