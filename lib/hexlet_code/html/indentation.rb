# frozen_string_literal: true

module HexletCode
  module Html
    # An utility class that makes it easier to track the indendation inside the HTML elements and
    # modify whitespace and indentation step as needed. Primarily used inside Html.build method when
    # recursively building an HTML element.
    class Indentation
      def initialize(size = 0, whitespace = ' ', step = 4)
        @size = size
        @whitespace = whitespace
        @step = step
      end

      def increased
        Indentation.new(@size + @step)
      end

      def to_s
        @whitespace * @size
      end
    end
  end
end
