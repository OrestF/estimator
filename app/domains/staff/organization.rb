module Staff
  class Organization < Sequel::Model
    many_to_many :users, class: 'Staff::User'
    one_to_many :projects, class: 'Estimation::Project'

    # CALLBACKS

    def before_destroy
      remove_all_users
      remove_all_projects
    end
  end
end
