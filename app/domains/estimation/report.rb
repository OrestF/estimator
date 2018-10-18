module Estimation
  class Report < Sequel::Model
    include Timestampable

    STATUSES = %i[new in_progress completed]
    TECHNOLOGIES = %i[ruby python react design]

    plugin :enum
    enum :status, STATUSES
    enum :technology, TECHNOLOGIES

    many_to_one :project, class: 'Estimation::Project'
    many_to_one :user, class: 'User'
    many_to_many :tasks, class: 'Estimation::Task'
  end
end
