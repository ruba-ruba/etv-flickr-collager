module FlickrCollager
  class Cli
    attr_reader :image_downloader

    def initialize(keywords = [])
      @image_downloader = ImageDownloader.new(keywords)
    end

    def execute
      image_downloader.preload
      crop_images
      assemble_collage
    end

    private

    def crop_images
    end

    def assemble_collage
    end
  end
end
