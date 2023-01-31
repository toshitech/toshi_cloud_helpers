# frozen_string_literal: true

require 'pg'

module ToshiCloudHelpers
  module ToshiWeb
    class Postgres
      def initialize(sql_statement)
        @sql_statement = sql_statement
        @db_connection = PG.connect(database_config)
      end

      def perform
        query = @db_connection.exec(@sql_statement)
        columns = query.fields
        query.results.map do |row|
          DatabaseRow.new(row, columns)
        end
      end

      def database_config
        {
          dbname: ENV["TOSHI_WEB_DB_NAME"],
          user: ENV["TOSHI_WEB_DB_USER"],
          host: ENV["TOSHI_WEB_DB_HOST"],
          port: ENV["TOSHI_WEB_DB_PORT"],
          password: ENV["TOSHI_WEB_DB_PASSWORD"]
        }
      end
    end
  end
end
