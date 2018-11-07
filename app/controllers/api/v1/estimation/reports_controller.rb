module Api
  module V1
    module Estimation
      class ReportsController < ::ApiController
        def index
          render json: ::Estimation::Report::Serializer.new(repo.all).call
        end

        def create
          # ::Estimation::Report::Create.new(report_params).call # TODO: dosent work
          res = repo.create(report_params)
          render json: res
        end

        private

        def report_params
          params.require(:report).permit(:technology, :status, :user_id, :project_id)
        end

        def repo
          @repo ||= ::Estimation::Report::Repo.new
        end
      end
    end
  end
end
