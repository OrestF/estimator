module Estimation
  class Task < Sequel::Model
    include Timestampable

    plugin :enum
    enum :technology, Estimation::Report::TECHNOLOGIES

    many_to_many :reports, class: 'Estimation::Report'
    many_to_one :user, class: 'User'
  end
end