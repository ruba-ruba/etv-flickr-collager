require 'rmagick'

module FlickrCollager
  class Collager
    include Magick

    attr_reader :images

    COLL = [0, 150, 300, 450]
    CENTER =  [0, 300]

    def initialize(images)
      @images = images
    end
    
    def execute
      background = Image.new(600, 600)
      images.first(4).each_with_index do |image, index|
        background.composite!(image, 0, COLL[index] , OverCompositeOp)
      end
      images[4..5].each_with_index do |image, index|
        background.composite!(image, 150, CENTER[index] , OverCompositeOp)
      end
      images.last(4).each_with_index do |image, index|
        background.composite!(image, 450, COLL[index] , OverCompositeOp)
      end
      background
    end    
  end
end
