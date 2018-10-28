module Entity
  # auto define dry-initializer options according to model columns
  def self.included(mod)
    mod.class_eval do
      mod.name.chomp('Entity').concat('Model').safe_constantize.columns.each { |column| option column, optional: true }
    end
  end

  def repo
    @repo ||= self.class.name.chomp('Entity').concat('Repo').safe_constantize.new
  end

  def to_h
    as_json.with_indifferent_access
  end
end
