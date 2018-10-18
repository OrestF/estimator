class Organization < Sequel::Model
  include Timestampable

  many_to_many :users
  one_to_many :projects, class: 'Estimation::Project'

  # CALLBACKS

  def before_destroy
    remove_all_users
    remove_all_projects
  end
end
