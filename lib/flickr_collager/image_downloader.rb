require "faraday"

module FlickrCollager
  # download images and return array of files
  class ImageDownloader
    attr_reader :flickr_client, :dictionary, :images

    def initialize flickr_client = FlickrClient.new, dictionary = Dictionary.new
      @flickr_client   = flickr_client
      @dictionary      = dictionary
      @images          = []
    end

    def preload(keywords)
      preload_images(keywords)
    end

    private

    def preload_images(keywords)
      loop do
        print_status
        keyword = keywords.shift || dictionary.sample
        photo = flickr_client.search_image(keyword)
        if photo.nil?
          puts "could not fetch photo for #{keyword} keyword"
          next
        end
        file = Tempfile.new("#{keyword}.jpg")
        file.write Faraday.get(photo["url_s"]).body
        images << file
        break if images.size == COLLAGE_SIZE
      end
    end

    def print_status
      print "preloading images #{images.size} of #{COLLAGE_SIZE} \r"
    end
  end
end
