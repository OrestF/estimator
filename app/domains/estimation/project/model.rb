module Estimation
  module Project
    class Model < Sequel::Model(:projects)
      many_to_one :organization, class: 'Staff::Organization::Model'
      one_to_many :reports, class: 'Estimation::Report::Model', key: :project_id
    end
  end
end
