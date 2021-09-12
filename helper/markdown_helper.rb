# frozen_string_literal: true

require 'redcarpet'

# Helper to parse markdown to html
class MarkdownHelper
  class << self
    def markdown
      @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                            autolink: true, space_after_headers: true)
    end

    def parse(text)
      markdown.render(text)
    end
  end
end
