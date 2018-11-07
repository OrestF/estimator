module Estimation
  module Report
    class Create
      def initialize(params)
        @params = params
        @repo = ::Estimation::Report::Repo.new
      end

      def call
        @repo.create(@params)
      end
    end
  end
end
