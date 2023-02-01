# frozen_string_literal: true

require 'mongo'

module ToshiCloudHelpers
  module ToshiPlan
    class Mongo
      def initialize
        @db_connection = ::Mongo::Client.new(ENV['MONGO_HOST'], database_config)
      end

      def perform(collection_name)
        @db_connection[collection_name]
      end

      def update_one(collection_name, filter, update)
        @db_connection[collection_name].find(filter).update_one(update)
      end

      protected

      def database_config
        {
          user: ENV['MONGO_USER'],
          password: ENV['MONGO_PASSWORD'],
          database: ENV['MONGO_DB_NAME']
        }
      end
    end
  end
end
