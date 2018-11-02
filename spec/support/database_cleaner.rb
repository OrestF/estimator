RSpec.configure do |config|
  config.before(:suite) do
    db = Sequel.connect(YAML.load(File.read(File.expand_path('../../../config/database.yml', __FILE__)))[Rails.env])
    DatabaseCleaner[:sequel].db = db
    DatabaseCleaner[:sequel].strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner[:sequel].start
  end

  config.after(:each) do
    DatabaseCleaner[:sequel].clean
  end
end
