# frozen_string_literal: true

module HexletCode
  # Contains functionality for HTML tags generation.
  module Tag
    @void_elements = %w[area base br col embed hr img input link meta source track wbr]

    def self.build(tag, attributes = {})
      html = attributes.reduce("<#{tag}") do |acc, (attr, value)|
        "#{acc} #{attr}=\"#{value}\""
      end

      @void_elements.include?(tag) ? "#{html}>" : "#{html}>#{yield if block_given?}</#{tag}>"
    end
  end
end
