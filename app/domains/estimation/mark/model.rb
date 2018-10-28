module Estimation
  module Mark
    class Model < Sequel::Model(:marks)
      plugin :validation_helpers

      many_to_one :task, class: 'Estimation::Task::Model'
      many_to_one :user, class: 'Staff::User::Model'

      # TODO: use Dry::Validations
      def validate
        super
        validates_presence [:optimistic]
      end
    end
  end
end
