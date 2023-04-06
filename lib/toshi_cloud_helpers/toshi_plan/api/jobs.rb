# frozen_string_literal: true

module ToshiCloudHelpers
  module ToshiPlan
    module Api
      class Jobs < Base
        def initialize
          super
        end

        def update_mongo_task_state(body)
          post('/mongo/task_state', body)
        end
      end
    end
  end
end