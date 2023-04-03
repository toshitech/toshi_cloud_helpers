# frozen_string_literal: true

module ToshiCloudHelpers
  module ToshiPlan
    class MongoQuery
      # Always call client#close function at the end of a cloud function
      def self.initialize_client
        ::Mongo::Client.new(ENV['MONGO_URI'])
      end

      def initialize(client:, collection:)
        @client = client
        @collection = collection
      end

      def collection
        @client[@collection]
      end

      # Usage:
      # client = ToshiCloudHelpers::ToshiPlan::MongoQuery.initialize_client
      # route = ToshiCloudHelpers::ToshiPlan::MongoQuery.new(
      #   client: client,
      #   collection: :routes
      # ).find_route(journey_id: j_id, route_date: date)

      # client.close # at the end of the cloud functions

      def find_route(journey_id:, route_date:)
        collection.find(
          {
            'steps.metadata.journey_id': journey_id,
            'deprecated': false,
            'route_date': route_date
          }
        ).first
      end

      def update_route(id:, new_doc:)
        collection.update_one(
          { '_id': id },
          { '$set': new_doc },
          { upsert: true }
        )
      end

      def save_shipment(attributes:)
        collection.update_one(
          { journey_id: attributes[:journey_id] },
          { '$set': attributes },
          upsert: true
        )
      end
    end
  end
end
