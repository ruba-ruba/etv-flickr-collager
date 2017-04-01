require 'rmagick'

module FlickrCollager
  class ImageCropper
    include Magick
    
    attr_reader :images

    def initialize(images)
      @images = images
    end
    
    def crop
    end
  end
end