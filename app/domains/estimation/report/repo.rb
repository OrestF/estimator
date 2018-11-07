module Estimation
  module Report
    class Repo < ::Repo
      def destroy(entity)
        entity.remove_all_marks
        super(entity)
      end

      # rubocop:disable Metrics/MethodLength
      def validation_schema
        # TODO: dry-validation not the best choice for Model validation

        Dry::Validation.Schema do
          configure do
            option :record

            def user_exist?(_attr_name, value)
              Staff::User::Repo.new.find(value).present?
            end

            def project_exist?(_attr_name, value)
              ::Estimation::Project::Repo.new.find(value).present?
            end

            def self.messages
              super.merge(en: { errors: { user_exist?: 'user not found', project_exist?: 'project not found' } })
            end
          end

          required(:user_id).filled(user_exist?: :user_id)
          required(:project_id).filled(project_exist?: :project_id)
          required(:technology).filled(included_in?: Estimation::Report::Model::TECHNOLOGIES)
        end
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end
