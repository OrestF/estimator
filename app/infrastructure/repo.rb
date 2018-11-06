class Repo
  def all
    model.all
  end

  def first
    model.first
  end

  def last
    model.last
  end

  def find(id)
    model[id]
  end

  def find!(id)
    model.with_pk!(id)
  end

  def create(params)
    record = model.new(params)

    validate_and_save(record, params)
  end

  def update(record, params)
    record.set(params)

    validate_and_save(record, params)
  end

  def destroy(record)
    record.destroy
  end

  def delete(record)
    record.delete
  end

  def purge_table
    model.all.each do |r|
      destroy(r)
    end
  end

  def model
    @model ||= self.class.name.chomp('Repo').concat('Model').safe_constantize
  end

  protected

  def validate_and_save(record, params)
    validation = validate(record.values.merge(params), record)
    byebug
    return record.save if validation.errors.none?

    validation.errors
  end

  def validate(params, record = model.new)
    validation_schema.with(record: record).call(params)
  end
end
