module Staff
  class UserRepo < ::Repo
    def schema
      Dry::Validation.Schema do
        required(:email).filled(format?: Devise.email_regexp)
      end
    end
  end
end
