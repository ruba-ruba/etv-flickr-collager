module FlickrCollager
  class Cli
    attr_reader :image_downloader

    def initialize(keywords = [])
      @image_downloader = ImageDownloader.new(keywords)
    end

    def execute
      image_downloader.preload
      images = crop_images
      assemble_collage(images)
    end

    private

    def crop_images
      ImageCropper.new(image_downloader.images).crop
    end

    def assemble_collage
      Collager.new(image_downloader.images).execute
    end
  end
end
