module FlickrCollager
  class Cli
    attr_reader :keywords

    def initialize(keywords = [])
      @keywords = keywords
      @images = images
    end

    def execute
      prepare_keywoards
      download_images
      crop_images
    end

    private

    def prepare_keywoards
      @keywords ||= KeywordFetcher.new.prepare(keywords)
    end

    def download_images
      @images ||= ImageDownloader.new(keywords).images
    end

    def crop_images
    end
  end
end
