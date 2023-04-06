# frozen_string_literal: true

module ToshiCloudHelpers
  module Api
    class ToshiPlan < Base
      def initialize
        super
      end

      def update_mongo_task_state(body)
        post('/mongo/task_state', body)
      end

      def base_url
        ENV["TOSHI_PLAN_URL"]
      end
    end
  end
end