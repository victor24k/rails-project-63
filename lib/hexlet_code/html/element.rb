# frozen_string_literal: true

module HexletCode
  module Html
    # Represents an HTML element that can have attributes and can contain other elements and/or text inside.
    # Content must be passed inside a block.
    class Element
      attr_reader :name, :attributes, :children

      def initialize(name, attributes)
        @name = name
        @attributes = attributes
        @children = *(yield if block_given?)
      end

      def to_s
        @to_s ||= Html.build(self, Indentation.new)
      end
    end
  end
end
