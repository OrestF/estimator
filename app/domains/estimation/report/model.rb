module Estimation
  module Report
    class Model < Sequel::Model(:reports)
      STATUSES = %i[new in_progress completed].freeze
      TECHNOLOGIES = %i[ruby python react design].freeze

      plugin :enum
      enum :status, STATUSES
      enum :technology, TECHNOLOGIES

      many_to_one :project, class: 'Estimation::Project::Model'
      many_to_one :user, class: 'Staff::User::Model'
      many_to_many :tasks, class: 'Estimation::Task::Model', join_table: :reports_tasks,
                                                             left_key: :report_id,
                                                             right_key: :task_id
      
      def before_destroy
        remove_all_tasks
      end
    end
  end
end
