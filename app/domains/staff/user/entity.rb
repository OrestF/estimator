module Staff
  module User
    class Entity
      extend ::Dry::Initializer
      include ::Entity
    end
  end
end
