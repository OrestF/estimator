class Repo
  def all
    model.all
  end

  def last
    model.last
  end

  def find(id)
    model[id]
  end

  def create(params)
    entity = model.new(params)

    validate_and_save(entity, params)
  end

  def update(entity, params)
    entity.set(params)

    validate_and_save(entity, params)
  end

  def destroy(entity)
    entity.destroy
  end

  def delete(entity)
    entity.delete
  end

  def model
    @model ||= self.class.name.chomp('Repo').safe_constantize
  end

  protected

  def validate_and_save(entity, params)
    validation = validate(entity.values.merge(params), entity)

    return entity.save if validation.errors.none?

    validation.errors
  end

  def validate(params, record = model.new)
    validation_schema.with(record: record).call(params)
  end
end
