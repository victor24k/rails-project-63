# frozen_string_literal: true

require_relative 'html'

module HexletCode
  # A form element to which you can pass ROPO and access the data in child elements which are defined inside the block.
  class Form < Html::Element
    def initialize(data, attributes)
      @data = data
      super('form', attributes)
    end

    def input(name, options = {})
      as = options.delete(:as)
      return textarea(name, options) if as == :text

      default_attributes = { name:, type: 'text', value: @data.public_send(name) }
      attributes = default_attributes.merge(options)
      label(for: name, text: name.to_s.capitalize)
      @children << Html::Element.new('input', attributes)
    end

    def textarea(name, options = {})
      default_attributes = { name:, cols: 20, rows: 40 }
      attributes = default_attributes.merge(options)
      label(for: name, text: name.to_s.capitalize)
      @children << Html::Element.new('textarea', attributes) { @data.public_send(name) }
    end

    def label(options = {})
      content = options.delete(:text)
      @children << Html::Element.new('label', options) { content }
    end

    def submit(value = 'Save')
      attributes = { type: 'submit', value: }
      @children << Html::Element.new('input', attributes)
    end
  end
end
