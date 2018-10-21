module Estimation
  class TaskRepo < ::Repo
    def destroy(entity)
      entity.remove_all_reports
      entity.marks.map(&:destroy)

      super(entity)
    end

    def plural?(word)
      word.pluralize == word
    end

    %w[optimistic pessimistic].each do |type|
      define_method("avg_#{type}_mark") do |entity|
        Estimation::Mark.where(task_id: entity.id).avg(type.to_sym)
      end
    end

    def validation_schema
      # TODO: dry-validation not the best choice for Model validation
      Dry::Validation.Schema do
        required(:title).filled
        required(:technology).filled(included_in?: ::Estimation::Report::TECHNOLOGIES)
        required(:user_id).filled(:int?)
      end
    end
  end
end
