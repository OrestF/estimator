class ApplicationRecord < Sequel::Model
  self.abstract_class = true

  # def before_create
  #   self.created_at ||= Time.now
  #   super
  # end

  # def before_save
  #   self.updated_at = Time.now
  #   super
  # end
end
