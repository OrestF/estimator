class Organization < Sequel::Model
  include Timestampable

  many_to_many :users
end
