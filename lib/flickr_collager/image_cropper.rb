require "rmagick"

module FlickrCollager
  # crop images with `some` strategy
  class ImageCropper
    include Magick

    # the collage 600x600px from 10 pics; 4 top row 2 middle row; 4 bottom row;
    STRATEGY = [150, 150, 150, 150, 300, 300, 150, 150, 150, 150].freeze

    attr_reader :images

    def initialize(images)
      @images = images
    end

    def crop
      images.map.with_index do |image, index|
        r_image = Image.read(image.open).first
        image.close
        image.unlink
        r_image.resize(STRATEGY[index], STRATEGY[index])
      end
    end
  end
end
