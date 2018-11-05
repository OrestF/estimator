module Estimation
  module Task
    module Entity
      include BaseEntity

      def avg_optimistic_mark
        repo.avg_optimistic_mark(self)
      end

      def avg_pessimistic_mark
        repo.avg_pessimistic_mark(self)
      end

      def avg_marks
        # TODO: optimize to one query
        { avg_optimistic_mark: avg_optimistic_mark, avg_pessimistic_mark: avg_optimistic_mark }
      end
    end
  end
end
