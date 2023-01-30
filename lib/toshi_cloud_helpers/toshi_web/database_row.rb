# frozen_string_literal: true

module ToshiCloudHelpers
  module ToshiWeb
    class DatabaseRow
      def initialize(row, columns)
        columns.each_with_index do |column, i|
          self.send("#{column}=", row[i])
        end
      end
    end
  end
end
