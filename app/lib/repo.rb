class Repo
  def all
    model.all.map { |r| as_entity(r) }
  end

  def first
    as_entity(model.first)
  end

  def last
    as_entity(model.last)
  end

  def find(id)
    as_entity(model[id])
  end

  # TODO: return Entities

  def create(params)
    record = model.new(params)

    validate_and_save(record, params)
  end

  def update(record, params)
    record.set(params)

    validate_and_save(record, params)
  end

  def destroy(entity)
    entity.destroy
  end

  def delete(entity)
    entity.delete
  end

  def purge_table
    model.all.each do |r|
      destroy(r)
    end
  end

  def model
    @model ||= self.class.name.chomp('Repo').concat('Model').safe_constantize
  end

  def entity
    @entity ||= self.class.name.chomp('Repo').concat('Entity').safe_constantize
  end

  protected

  def as_entity(record)
    return nil if record.nil?

    entity.new record.values
  end

  def validate_and_save(entity, params)
    validation = validate(entity.values.merge(params), entity)

    return entity.save if validation.errors.none?

    validation.errors
  end

  def validate(params, record = model.new)
    validation_schema.with(record: record).call(params)
  end
end
