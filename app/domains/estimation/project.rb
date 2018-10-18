module Estimation
  class Project < Sequel::Model
    include Timestampable

    many_to_one :organization
    one_to_many :reports
  end
end