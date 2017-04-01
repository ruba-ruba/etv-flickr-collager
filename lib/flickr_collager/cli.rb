module FlickrCollager
  class Cli
    attr_accessor :keywords

    def initialize(keywords = [])
      @keywords = keywords
    end

    def execute
      prepare_keywoards
      query_images
    end

    private

    def prepare_keywoards
      self.keywords = KeywordFetcher.new.prepare(keywords)
    end

    def query_images
      puts "querying images for: #{keywords.join(', ')}"
    end
  end
end
