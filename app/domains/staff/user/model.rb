module Staff
  module User
    class Model < Sequel::Model(:users)
      include Entity
      
      plugin :devise

      devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable

      many_to_many :organizations, class: 'Staff::Organization::Model', join_table: :organizations_users,
                                                                        left_key: :user_id,
                                                                        right_key: :organization_id

      many_to_many :estimations, class: 'Estimation::Project::Model', join_table: :projects_users,
                                                                      left_key: :user_id,
                                                                      right_key: :project_id

      one_to_many :reports, class: 'Estimation::Report::Model', key: :user_id
      one_to_many :marks, class: 'Estimation::Mark::Model', key: :user_id
      one_to_many :tasks, class: 'Estimation::Task::Model', key: :user_id


      def will_save_change_to_email?
        # fix for devise/sequel
      end
    end
  end
end
