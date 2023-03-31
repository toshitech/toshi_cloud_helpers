# frozen_string_literal: true

module ToshiCloudHelpers
  module ToshiPlan
    module Mongo
      # abstract class. Define a collection class and inherit from this
      class Base
        def initialize
          @db_connection = ::Mongo::Client.new(ENV['MONGO_URI'])
        end

        def collection
          @db_connection[collection_name]
        end

        def collection_name
          raise NotImplementedError, "Define this on your child class"
        end
      end
    end
  end
end
