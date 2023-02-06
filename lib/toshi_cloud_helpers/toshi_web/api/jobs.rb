# frozen_string_literal: true

module ToshiCloudHelpers
  module ToshiWeb
    module Api
      class Jobs < Base
        def initialize(base_url: 'https://wwww.toshi.co')
          @base_url = base_url
          super
        end

        def create(body)
          post('/api/v3/cloud_functions/jobs', body)
        end
      end
    end
  end
end
