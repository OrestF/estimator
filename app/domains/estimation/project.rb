module Estimation
  class Project < Sequel::Model
    include Timestampable

    many_to_one :organization
  end
end