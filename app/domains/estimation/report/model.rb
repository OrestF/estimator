module Estimation
  module Report
    class Model < Sequel::Model(:reports)
      STATUSES = %w[new in_progress completed].freeze
      TECHNOLOGIES = %w[ruby python react design].freeze

      plugin :enum
      enum :status, STATUSES
      enum :technology, TECHNOLOGIES

      many_to_one :project, class: 'Estimation::Project::Model'
      many_to_one :user, class: 'Staff::User::Model'
      many_to_many :tasks, class: 'Estimation::Task::Model',
                           join_table: :reports_tasks,
                           left_key: :report_id,
                           right_key: :task_id

      def before_destroy
        remove_all_tasks
      end

      def before_save
        set(technology: TECHNOLOGIES.index(technology))
        super
      end
    end
  end
end
