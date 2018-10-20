module Entity
  # auto define dry-initializer options according to model columns
  def self.included(mod)
    mod.class_eval do
      mod.name.chomp('Entity').safe_constantize.columns.each { |column| option column, optional: true }
    end
  end
end
