# frozen_string_literal: true

module HexletCode
  module Html
    # An ordinary HTML element that can have other elements inside it.
    class Element
      attr_reader :name, :attributes, :children

      def initialize(name, attributes)
        @name = name
        @attributes = attributes
        @children = *(yield if block_given?)
      end

      def to_s
        @to_s ||= HexletCode::Html.build_element_recursively(self, Indentation.new)
      end
    end
  end
end
