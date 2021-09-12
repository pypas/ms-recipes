# frozen_string_literal: true

require 'contentful'
require 'dotenv'

Dotenv.load

# Service to retrieve data from Contentful
class ContentfulService
  class << self
    def get_entries(type)
      Contentful::Client.new(
        space: ENV['SPACE_ID'],
        access_token: ENV['ACCESS_TOKEN']
      ).entries(content_type: type)
    end
  end
end
