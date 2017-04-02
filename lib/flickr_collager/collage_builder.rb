module FlickrCollager
  class BuilderError < StandardError; end

  # load images, resize & build collage
  # returns self
  class CollageBuilder
    def self.build(keywords)
      new(keywords).build
    end

    attr_reader :keywords, :collage

    def initialize keywords
      @keywords = keywords
      @collage = Collage.new
    end

    def build
      preload_images
      crop_images
      assemble_collage
      self
    end

    private

    def preload_images
      image_downloader.preload(keywords)
      collage.images = image_downloader.images
    end

    def crop_images
      raise BuilderError.new("images not yet downloaded") if Array(collage.images).empty?
      collage.crop_images = ImageCropper.new(collage.images).crop
    end

    def assemble_collage
      raise BuilderError.new("images not yet cropped") if Array(collage.crop_images).empty?
      collage.result = Collager.new(collage.crop_images).execute
    end

    def image_downloader
      @image_downloader ||= ImageDownloader.new
    end
  end
end
