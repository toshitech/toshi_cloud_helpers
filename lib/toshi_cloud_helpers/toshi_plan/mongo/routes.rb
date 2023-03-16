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
          collection.find({ '_id': "ObjectId(#{@attributes[:route_id]})" }).limit(1).first
        end
      end
    end
  end
end