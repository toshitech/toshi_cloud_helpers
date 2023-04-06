# frozen_string_literal: true

module ToshiCloudHelpers
  module Api
    class ToshiWeb < Base
      def initialize
        super
      end

      def create(body)
        post('/api/v3/cloud_functions/jobs', body)
      end

      def base_url
        case ENV["ENVIRONMENT_NAME"]
        when "production"
          "https://api.toshi.co"
        when "staging"
          "https://staging.api.toshi.co"
        else
          ENV['API_SERVER_URL']
        end
      end
    end
  end
end
