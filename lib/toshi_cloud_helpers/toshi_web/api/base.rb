require 'openssl'

module ToshiCloudHelpers
  module ToshiWeb
    module Api
      # Top level comment
      class Base
        PUBLIC_KEY_HEADER = "X-Authorization-Public-Key"
        TIMESTAMP_HEADER = "X-Authorization-Timestamp"
        TIMESTAMP_HASH = "X-Authorization-Content-SHA256"

        include HTTParty

        def initialize
          @public_key = ENV["TOSHI_WEB_PUBLIC_KEY"]
          @secret_key = ENV["TOSHI_WEB_SECRET_KEY"]
          @timestamp = Time.now.to_i
          @hash = ::OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), @secret_key, "#{@public_key}:#{@timestamp}")
        end

        def post(path, body)
          address = url(path)
          options = {
            headers: {
              PUBLIC_KEY_HEADER => @public_key,
              TIMESTAMP_HEADER => @timestamp.to_s,
              TIMESTAMP_HASH => @hash,
              'Content-Type' => 'application/json'
            },
            body: body
          }
          self.class.post(address, options)
        end

        def url(path)
          "#{base_url}#{path}"
        end

        protected

        def base_url
          case ENV["ENVIRONMENT_NAME"]
          when "production"
            "https://api.toshi.co"
          when "staging"
            "https://staging.api.toshi.co"
          else
            "https://api.toshi.test"
          end
        end
      end
    end
  end
end
