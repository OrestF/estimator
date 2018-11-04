module Estimation
  module Report
    class Repo < ::Repo
      def destroy(entity)
        entity.remove_all_marks
        super(entity)
      end
    end
  end
end
