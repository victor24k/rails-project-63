# frozen_string_literal: true

require_relative "html"

module HexletCode
  # A form element to which you can pass ROPO and access the data in child elements.
  class Form < Html::Element
    def initialize(data, attributes)
      @data = data
      super("form", attributes)
    end

    def input(name, options = {})
      as = options.delete(:as)
      return textarea(name, options) if as == :text

      attributes = { name:, type: "text", value: @data[name] }.merge(options)
      @children << Html::Element.new(__method__.to_s, attributes)
    end

    def textarea(name, options = {})
      default_attributes = { name:, cols: 20, rows: 40 }
      attributes = default_attributes.merge(options)
      @children << Html::Element.new(__method__.to_s, attributes) { @data[name] }
    end
  end
end
