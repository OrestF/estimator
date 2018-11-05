module Staff
  module Organization
    class Model < Sequel::Model(:organizations)
      many_to_many :users, class: 'Staff::User::Model',
                           join_table: :organizations_users,
                           left_key: :organization_id,
                           right_key: :user_id
      one_to_many :projects, class: 'Estimation::Project::Model', key: :organization_id

      # CALLBACKS

      def before_destroy
        remove_all_users
        remove_all_projects
      end
    end
  end
end
