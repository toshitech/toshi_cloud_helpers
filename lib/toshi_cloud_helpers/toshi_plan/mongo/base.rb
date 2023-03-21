# frozen_string_literal: true

module ToshiCloudHelpers
  module ToshiPlan
    module Mongo
      # abstract class. Define a collection class and inherit from this
      class Base
        def initialize
          @db_connection = ::Mongo::Client.new([ENV['MONGO_HOST']], database_config)
        end

        def collection
          @db_connection[collection_name]
        end

        def collection_name
          raise NotImplementedError, "Define this on your child class"
        end

        protected

        def database_config
          {
            user: ENV['MONGO_USER'],
            password: ENV['MONGO_PASSWORD'],
            database: ENV['MONGO_DB_NAME']
          }
        end

        def connection_string
          "mongodb://#{ENV["MONGO_USER"]}:#{ENV["MONGO_PASSWORD"]}@#{ENV["MONGO_HOST"]}/#{ENV["MONGO_DB_NAME"]}"
        end
      end
    end
  end
end
