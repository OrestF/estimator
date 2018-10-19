RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner[:sequel].strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner[:sequel].start
  end

  config.after(:each) do
    DatabaseCleaner[:sequel].clean
  end
end
