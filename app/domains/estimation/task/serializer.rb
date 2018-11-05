module Estimation
  module Task
    class Serializer
      def initialize(task)
        @tasks = Array(task)
      end

      def autocomplete
        @tasks.map do |task|
          serialize_task(task, 'autocomplete')
        end
      end

      private

      def serialize_task(task, type)
        hash = task.values.slice(*send("#{type}_fields"))
        hash[:technology] = task.technology
        hash
      end

      def autocomplete_fields
        %i[id title technology]
      end
    end
  end
end
