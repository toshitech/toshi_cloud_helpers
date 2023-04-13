# frozen_string_literal: true

module ToshiCloudHelpers
  module Api
    class ToshiWeb < Base
      def create(body)
        post("/api/v3/cloud_functions/jobs", body)
      end

      def base_url
        case ENV["ENVIRONMENT_NAME"]
        when "production"
          "https://api.toshi.co"
        when "staging"
          "https://staging.api.toshi.co"
        else
          ENV["API_SERVER_URL"]
        end
      end

      protected

      def secret_key
        ENV["TOSHI_WEB_SECRET_KEY"]
      end

      def public_key
        ENV["TOSHI_WEB_PUBLIC_KEY"]
      end

      def service_name_header
        "toshi-web"
      end
    end
  end
end
