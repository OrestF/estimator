module Estimation
  module Project
    class Assigner
      def initialize(project, users)
        @project = project
        @users = users
      end

      def call
        @users.each do |user|
          @project.add_estimator(user)
        end
      end
    end
  end
end
