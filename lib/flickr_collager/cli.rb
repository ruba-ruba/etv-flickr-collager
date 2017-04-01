module FlickrCollager
  class Cli
    attr_reader :image_downloader

    def initialize(keywords = [])
      @image_downloader = ImageDownloader.new(keywords)
    end

    def execute
      image_downloader.preload
      images = crop_images
      collage = assemble_collage(images)
      puts "collage have been generated"
      printf "provide filename: "
      filename = gets
      collage.write("#{filename}.jpg")
    end

    private

    def crop_images
      ImageCropper.new(image_downloader.images).crop
    end

    def assemble_collage(images)
      Collager.new(images).execute
    end
  end
end
