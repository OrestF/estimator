Sequel.connect(YAML.load(File.read(File.expand_path('../../database.yml', __FILE__)))[Rails.env])
#  TODO: uncomment in case of migration errors
#  createdb -U <user> estimator_development
