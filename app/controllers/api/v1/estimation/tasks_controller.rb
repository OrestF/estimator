module Api
  module V1
    module Estimation
      class TasksController < ::ApiController
        def search
          tasks = ::Estimation::Task::Search.for_report(params[:query], params[:technology])
          render json: ::Estimation::Task::Serializer.new(tasks).autocomplete
        end
      end
    end
  end
end
