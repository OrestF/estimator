module Estimation
  class Mark < Sequel::Model
    include Timestampable

    many_to_one :task, class: 'Estimation::Task'
    many_to_one :user, class: 'User'
  end
end