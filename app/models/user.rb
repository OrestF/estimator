class User < Sequel::Model
  include Timestampable

  plugin :devise

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  many_to_many :organizations

  # CALLBACKS

  def before_destroy
    remove_all_organizations
  end

  def will_save_change_to_email?
    # fix for devise/sequel
  end
end
