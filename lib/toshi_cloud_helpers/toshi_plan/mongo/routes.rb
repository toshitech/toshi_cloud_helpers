# frozen_string_literal: true

module ToshiCloudHelpers
  module ToshiPlan
    module Mongo
      class Routes < Base
        def initialize(options)
          @attributes = options
          super()
        end

        def collection_name
          'routes'
        end

        def find_route
          collection.find(
            {
              'steps.metadata.journey_id': @attributes[:journey_id],
              'deprecated': false,
              'route_date': @attributes[:route_date]
            }
          ).first
        end

        def update_route
          collection.update_one({ _id: @attributes[:id] }, @attributes[:new_doc], { upsert: true })
        end
      end
    end
  end
end