require 'rmagick'

module FlickrCollager
  class Collager
    include Magick

    attr_reader :images

    def initialize(images)
      @images = images
    end
    
    def execute
    end    
  end
end
