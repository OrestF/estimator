module Api
  module V1
    module Estimation
      class TasksController < ::ApiController
        def search
          ::Estimation::Task::Search.for_report(params[:query], params[:technology]).as_json
        end
      end
    end
  end
end
