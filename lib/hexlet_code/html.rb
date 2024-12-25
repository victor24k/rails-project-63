# frozen_string_literal: true

require_relative 'html/element'
require_relative 'html/indentation'

module HexletCode
  # Contains functionality for building HTML elements.
  module Html
    @void_elements = %w[area base br col embed hr img input link meta source track wbr]

    def self.build_content(children, indentation)
      children
        .map { |child| "#{indentation}#{child}" }
        .join("\n")
    end

    def self.build_attributes(attributes)
      attributes
        .map { |(name, value)| "#{name}=\"#{value}\"" }
        .join(' ')
    end

    def self.build_opening_tag(element, indentation)
      attributes = build_attributes(element.attributes)

      if attributes.empty?
        [indentation, '<', element.name, '>'].join
      else
        [indentation, '<', element.name, ' ', attributes, '>'].join
      end
    end

    def self.build_closing_tag(element, indentation = nil)
      [indentation, '</', element.name, '>'].join
    end

    def self.build_singleline_element(element, child, indentation)
      opening_tag = build_opening_tag(element, indentation)
      return opening_tag if @void_elements.include?(element.name)

      closing_tag = build_closing_tag(element)

      [opening_tag, child, closing_tag].join
    end

    def self.build_multiline_element(element, children, indentation)
      opening_tag = build_opening_tag(element, indentation)
      content = build_content(children, indentation)
      closing_tag = build_closing_tag(element, indentation)

      [opening_tag, content, closing_tag].join("\n")
    end

    def self.build_element_recursively(element, indentation)
      return element if element.is_a?(String)

      children = element.children.map { |child| build_element_recursively(child, indentation.increased) }

      if element.children.count.zero? || (element.children.count == 1 && element.children.first.is_a?(String))
        build_singleline_element(element, children, indentation)
      else
        build_multiline_element(element, children, indentation)
      end
    end
  end
end
