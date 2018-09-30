class User < Sequel::Model
  plugin :devise

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def will_save_change_to_email?
    # fix for devise/sequel
  end       

  def before_create
    self.created_at ||= Time.now
    super
  end

  def before_save
    self.updated_at = Time.now
    super
  end
end
