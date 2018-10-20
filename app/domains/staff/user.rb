module Staff
  class User < Sequel::Model
    plugin :devise

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    many_to_many :organizations, class: 'Staff::Organization'
    one_to_many :reports, class: 'Estimation::Report'
    one_to_many :marks, class: 'Estimation::Mark'
    one_to_many :tasks, class: 'Estimation::Task'

    def will_save_change_to_email?
      # fix for devise/sequel
    end
  end
end
