# frozen_string_literal: true

require_relative "html"

module HexletCode
  # A form element to which you can pass ROPO and access the data in child elements which are defined inside the block.
  class Form < Html::Element
    def initialize(data, attributes)
      @data = data
      super("form", attributes)
    end

    def input(name, options = {})
      as = options.delete(:as)
      return textarea(name, options) if as == :text

      default_attributes = { name:, type: "text", value: @data[name] }
      attributes = default_attributes.merge(options)
      @children << Html::Element.new("label", for: name) { name.to_s.capitalize }
      @children << Html::Element.new(__method__.to_s, attributes)
    end

    def textarea(name, options = {})
      default_attributes = { name:, cols: 20, rows: 40 }
      attributes = default_attributes.merge(options)
      @children << Html::Element.new(__method__.to_s, attributes) { @data[name] }
    end

    def submit(value = "Save")
      attributes = { type: "submit", value: }
      @children << Html::Element.new("input", attributes)
    end
  end
end
