# frozen_string_literal: true

module ToshiCloudHelpers
  module ToshiWeb
    module Api
      # Top level comment
      class Base
        PUBLIC_KEY_HEADER = "X-Authorization-Public-Key"
        TIMESTAMP_HEADER = "X-Authorization-Timestamp"
        TIMESTAMP_HASH = "X-Authorization-Content-SHA256"
        def initialize
          @public_key = ENV["TOSHI_WEB_PUBLIC_KEY"]
          @secret_key = ENV["TOSHI_WEB_SECRET_KEY"]
          @timestamp = Time.now.to_i
          @hash = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), @secret_key, "#{@public_key}:#{@timestamp}")
        end

        def post(path, body)
          address = url(path)
          req = Net::HTTP::Post.new(address)
          req.body = body
          add_headers(req)
          Net::HTTP.start(address) do |http|
            http.request(req)
          end
        end

        def url(path)
          URI("#{base_url}#{path}")
        end

        protected

        def add_headers(req)
          req.add_field(PUBLIC_KEY_HEADER, @public_key)
          req.add_field(TIMESTAMP_HEADER, @timestamp)
          req.add_field(TIMESTAMP_HASH, @hash)
        end
      end
    end
  end
end
