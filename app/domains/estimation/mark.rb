module Estimation
  class Mark < Sequel::Model
    plugin :validation_helpers

    many_to_one :task, class: 'Estimation::Task'
    many_to_one :user, class: 'Staff::User'

    # TODO: use Dry::Validations
    def validate
      super
      validates_presence [:optimistic]
    end
  end
end
