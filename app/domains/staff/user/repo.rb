module Staff
  module User
    class Repo < ::Repo

      def destroy(entity)
        entity.remove_all_organizations
        entity.remove_all_reports
        entity.remove_all_tasks
        entity.remove_all_estimations

        super(entity)
      end

      def validation_schema
        # TODO: dry-validation not the best choice for Model validation

        Dry::Validation.Schema do
          configure do
            option :record

            def unique?(attr_name, value)
              record.class.exclude(id: record.id).where(attr_name => value).empty?
            end

            def self.messages
              super.merge(en: { errors: { unique?: 'already exist' } })
            end
          end

          required(:email).filled(format?: Devise.email_regexp)
          required(:email).filled(unique?: :email)
          required(:password).filled(size?: 6..30).confirmation
        end
      end
    end
  end
end
