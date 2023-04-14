# frozen_string_literal: true

require "openssl"

module ToshiCloudHelpers
  module Api
    # Top level comment
    class Base
      PUBLIC_KEY_HEADER = "X-Authorization-Public-Key"
      TIMESTAMP_HEADER = "X-Authorization-Timestamp"
      TIMESTAMP_HASH = "X-Authorization-Content-SHA256"
      SERVICE_NAME_HEADER = "X-Authorization-ServiceName"

      include HTTParty

      def initialize
        @public_key = public_key
        @secret_key = secret_key
        @timestamp = Time.now.to_i
        @hash = ::OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), @secret_key, "#{@public_key}:#{@timestamp}")
      end

      def public_key
        raise NotImplementedError, "must be implemented in a subclass"
      end

      def secret_key
        raise NotImplementedError, "must be implemented in a subclass"
      end

      def service_name_header
        ENV['HMAC_SERVICE_NAME_HEADER']
      end

      def post(path, body)
        address = url(path)
        options = {
          headers: {
            PUBLIC_KEY_HEADER => @public_key,
            TIMESTAMP_HEADER => @timestamp.to_s,
            TIMESTAMP_HASH => @hash,
            SERVICE_NAME_HEADER => service_name_header,
            "Content-Type" => "application/json"
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
        raise NotImplementedError, "base_url must be implemented in a subclass"
      end
    end
  end
end
