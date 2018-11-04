module Estimation
  module Mark
    class Model < Sequel::Model(:marks)
      plugin :validation_helpers

      many_to_one :task, class: 'Estimation::Task::Model'
      many_to_one :user, class: 'Staff::User::Model'
      many_to_one :report, class: 'Estimation::Report::Model'

      # TODO: use Dry::Validations
      def validate
        super
        validates_presence [:optimistic]
      end

      def report
        Estimation::Report::Repo.new.find(self[:report_id]) # beacuse of shit
      end
    end
  end
end
