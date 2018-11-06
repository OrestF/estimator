module Api
  module V1
    module Estimation
      class TasksController < ::ApiController
        def autocomplete
          tasks = ::Estimation::Task::Search.for_report(params[:query], params[:technology])
          render json: ::Estimation::Task::Serialize.new(tasks).autocomplete
        end

        def avg_marks
          render json: task.avg_marks
        end

        private

        def repo
          @repo ||= ::Estimation::Task::Repo.new
        end

        def task
          repo.find!(params[:id])
        end
      end
    end
  end
end
