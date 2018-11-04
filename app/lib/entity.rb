module Entity
  # auto define dry-initializer options according to model columns
  def self.included(mod)
    # mod.class_eval do
      # mod.name.chomp('Entity').concat('Model').safe_constantize.columns.each { |column| option column, optional: true }
    # end
    mod.extend(ClassMethods)
  end

  def repo
    @repo ||= self.class.name.chomp('Entity').concat('Repo').safe_constantize.new
  end

  def to_h
    as_json.with_indifferent_access
  end

  module ClassMethods
    def all
      raise 'NotImplemented'
    end

    def where
      raise 'NotImplemented'
    end

    def delete_all
      raise 'NotImplemented'
    end

    def first
      raise 'NotImplemented'
    end

    def last
      raise 'NotImplemented'
    end

    def []
      raise 'NotImplemented'
    end
  end

  def delete
    raise 'NotImplemented'
  end

  def save
    raise 'NotImplemented'
  end

  def destroy
    raise 'NotImplemented'
  end
end
# TODO: entity is shit! Deal with it!
