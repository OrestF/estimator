class Repo
  def find(id)
    model[id]
  end

  def create(params)
    entity = model.new(params)
    validation = validate(params)
    # TODO: dry-validation not the best choice for Model validation
    # need to change validation flow
    return entity.save if validation.errors.none?

    validation.errors
  end

  protected

  def validate(params)
    schema.call(params)
  end

  def model
    @model ||= self.class.name.chomp('Repo').safe_constantize
  end
end
