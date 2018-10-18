class User < Sequel::Model
  include Timestampable

  plugin :devise

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  many_to_many :organizations
  one_to_many :reports, class: 'Estimation::Report'

  # CALLBACKS

  def before_destroy
    remove_all_organizations
    remove_all_reports
  end

  def will_save_change_to_email?
    # fix for devise/sequel
  end
end
