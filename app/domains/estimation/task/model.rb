module Estimation
  module Task
    class Model < Sequel::Model(:tasks)
      plugin :enum
      plugin :elasticsearch
      enum :technology, Estimation::Report::Model::TECHNOLOGIES

      many_to_many :reports, class: 'Estimation::Report::Model', join_table: :reports_tasks,
                                                                 left_key: :task_id,
                                                                 right_key: :report_id
      many_to_one :user, class: 'Staff::User::Model'
      one_to_many :marks, class: 'Estimation::Mark::Model', key: :task_id
    end
  end
end
