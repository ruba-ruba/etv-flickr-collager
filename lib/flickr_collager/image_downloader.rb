require 'faraday'

module FlickrCollager
  class ImageDownloader
    attr_reader :keywords, :flickr_client, :images

    def initialize keywords, flickr_client = FlickrClient.new
      @keywords = keywords
      @flickr_client = flickr_client
      @images = images
    end

    def images
      @images ||= preload_images
    end

    private

    def preload_images
      @images ||= 
        keywords.map do |keyword|
          photos = flickr_client.search_image(keyword)
          if Array(photos).empty?
            puts "could not fetch photo for #{keyword} keyword"
            next
          end
          file = Tempfile.new("#{keyword}.jpg")
          content = Faraday.get(photos.first["url_s"]).body
          file.write content
          file
        end
      end
  end
end
