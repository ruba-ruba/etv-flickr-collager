require "faraday"

module FlickrCollager
  # download images and return array of files
  class ImageDownloader
    attr_reader :keywords, :flickr_client, :dictionary, :images

    def initialize keywords, flickr_client = FlickrClient.new, dictionary = Dictionary.new
      @keywords        = keywords
      @flickr_client   = flickr_client
      @dictionary      = dictionary
      @images          = []
    end

    def preload
      print "preloading images #{images.size} of #{COLLAGE_SIZE} \r"
      return if images.size == COLLAGE_SIZE
      preload_image(keywords.pop || dictionary.sample)
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
