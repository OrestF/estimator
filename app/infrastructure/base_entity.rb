module BaseEntity
  def repo
    @repo ||= self.class.name.chomp('Model').concat('Repo').safe_constantize.new
  end

  def to_h
    as_json.with_indifferent_access
  end
end
