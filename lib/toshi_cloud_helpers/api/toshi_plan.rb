# frozen_string_literal: true

module ToshiCloudHelpers
  module Api
    class ToshiPlan < Base
      def update_mongo_task_state(body)
        post("/mongo/task_state", body)
      end

      def base_url
        ENV["TOSHI_PLAN_URL"]
      end

      protected

      def secret_key
        ENV["TOSHI_PLAN_SECRET_KEY"]
      end

      def public_key
        ENV["TOSHI_PLAN_PUBLIC_KEY"]
      end
    end
  end
end
