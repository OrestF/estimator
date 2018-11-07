module Estimation
  module Report
    class Serializer
      def initialize(report)
        @reports = Array(report)
      end

      def call
        @reports.map do |report|
          serialize_report(report, 'collection')
        end
      end

      private

      def serialize_report(report, type)
        hash = report.values.slice(*send("#{type}_fields"))
        hash[:technology] = report.technology
        hash
      end

      def collection_fields
        %i[id technology status user_id project_id created_at updated_at]
      end
    end
  end
end
