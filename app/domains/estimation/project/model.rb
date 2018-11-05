module Estimation
  module Project
    class Model < Sequel::Model(:projects)
      many_to_one :organization, class: 'Staff::Organization::Model'
      one_to_many :reports, class: 'Estimation::Report::Model', key: :project_id

      many_to_many :estimators, class: 'Staff::User::Model',
                                join_table: :projects_users,
                                left_key: :project_id,
                                right_key: :user_id
    end
  end
end
