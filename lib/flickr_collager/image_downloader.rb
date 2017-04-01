require 'faraday'

module FlickrCollager
  class ImageDownloader
    COLLAGE_SIZE = 2
    attr_reader :keywords, :flickr_client, :keyword_fetcher, :images

    def initialize keywords, flickr_client = FlickrClient.new, keyword_fetcher = KeywordFetcher.new
      @keywords        = keywords
      @flickr_client   = flickr_client
      @keyword_fetcher = keyword_fetcher
      @images          = []
    end

    def preload
      return if images.size == COLLAGE_SIZE
      preload_image(keywords.pop || keyword_fetcher.sample)
      preload
    end

    private

    def preload_image(keyword)
      photo = flickr_client.search_image(keyword)
      if photo.nil?
        puts "could not fetch photo for #{keyword} keyword"
        return
      end
      file = Tempfile.new("#{keyword}.jpg")
      content = Faraday.get(photo["url_s"]).body
      file.write content
      images << file
    end
  end
end
