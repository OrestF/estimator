module Estimation
  module Project
    class Assigner
      def initialize(project, users)
        @project = project
        @users = filter_assigned(users)
      end

      def call
        @users.each do |user|
          @project.add_estimator(user)
        end
      end
      
      private  
      
      def filter_assigned(users)
        @users = Array(users) - @project.estimators
      end
    end
  end
end
