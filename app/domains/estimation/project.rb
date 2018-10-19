module Estimation
  class Project < Sequel::Model
    many_to_one :organization, class: 'Staff::Organization'
    one_to_many :reports, class: 'Estimation::Report'
  end
end
