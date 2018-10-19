module Estimation
  class Report < Sequel::Model
    STATUSES = %i[new in_progress completed].freeze
    TECHNOLOGIES = %i[ruby python react design].freeze

    plugin :enum
    enum :status, STATUSES
    enum :technology, TECHNOLOGIES

    many_to_one :project, class: 'Estimation::Project'
    many_to_one :user, class: 'Staff::User'
    many_to_many :tasks, class: 'Estimation::Task'

    def before_destroy
      remove_all_tasks
    end
  end
end
