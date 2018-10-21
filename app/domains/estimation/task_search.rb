module Estimation
  class TaskSearch
    def self.title(search_string)
      new('title', search_string).send(:search)
    end

    def initialize(field, search_string)
      @field = field
      @search_string = search_string
    end

    private

    def search
      ::Estimation::Task.es(send("#{@field}_query"))
    end

    def title_query
      {
        query: {
          bool: {
            must: @search_string.split(' ').map { |word| wildcard(word) }
          }
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
