module Staff
  module User
    module Entity
      include BaseEntity

      def proof
        puts 'user'
      end
    end
  end
end
