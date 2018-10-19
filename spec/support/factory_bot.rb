RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  to_create do |instance|
    raise Sequel::ValidationFailed.new instance.errors unless instance.save
  end
end
