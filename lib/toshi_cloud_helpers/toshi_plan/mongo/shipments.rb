# frozen_string_literal: true

module ToshiCloudHelpers
  module ToshiPlan
    module Mongo
      class Shipments < Base
        def initialize(options)
          @attributes = options
          super()
        end

        def collection_name
          'shipments'
        end

        def save
          collection.update_one({ journey_id: @attributes[:journey_id] }, { '$set': @attributes }, upsert: true)
        end
      end
    end
  end
end
