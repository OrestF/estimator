module Estimation
  module Task
    class Search
      class InvalidTechnologyError < StandardError; end

      def self.for_report(search_string, technology)
        new('title', search_string, technology).send(:search)
      end

      def initialize(field, search_string, technology)
        @field = field
        @search_string = search_string
        @technology = technology
      end

      private

      def search
        ::Estimation::Task::Model.es(send("#{@field}_query"))
      end

      def tech_index(tech_name)
        raise InvalidTechnologyError, tech_name unless technologies.include?(tech_name.to_sym)

        technologies.index(tech_name.to_sym)
      end

      def technologies
        Estimation::Report::Model::TECHNOLOGIES
      end

      def title_query
        {
          query: {
            bool: {
              must: @search_string.split(' ').map { |word| wildcard(word) }.append(tech_term)
            }
          }
        }
      end

      def tech_term
        {
          term: {
            technology: tech_index(@technology)
          }
        }
      end

      def wildcard(word)
        {
          wildcard: {
            @field.to_sym => "*#{word}*"
          }
        }
      end
    end
  end
end
