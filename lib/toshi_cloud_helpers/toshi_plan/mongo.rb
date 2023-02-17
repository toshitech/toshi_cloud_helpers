# frozen_string_literal: true

require "mongo"

module ToshiCloudHelpers
  module ToshiPlan
    class Mongo
      def initialize
        @db_connection = ::Mongo::Client.new(connection_string)
      end

      def perform(collection_name)
        @db_connection[collection_name]
      end

      def update_one(collection_name, filter, update)
        @db_connection[collection_name].find(filter).update_one(update)
      end

      protected

      def connection_string
        "mongodb://#{ENV["MONGO_USER"]}:#{ENV["MONGO_PASSWORD"]}@#{ENV["MONGO_HOST"]}/#{ENV["MONGO_DB_NAME"]}"
      end
    end
  end
end
