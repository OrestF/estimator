class User < Sequel::Model
  include Timestampable

  plugin :devise

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  many_to_many :organizations

  def will_save_change_to_email?
    # fix for devise/sequel
  end
end
