# frozen_string_literal: true

require 'contentful'
require 'dotenv'

Dotenv.load

# Service to retrieve data from Contentful
class ContentfulService
  class << self
    def client
      @client ||= Contentful::Client.new(
        space: ENV['SPACE_ID'],
        access_token: ENV['ACCESS_TOKEN']
      )
    end

    def get_entries(type)
      client.entries(content_type: type)
    end

    def get_entry(id)
      client.entry(id)
    end
  end
end
