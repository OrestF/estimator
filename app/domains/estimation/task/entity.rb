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
    end
  end
end
