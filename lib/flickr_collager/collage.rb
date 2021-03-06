module FlickrCollager
  # container for collage builder
  class Collage < Struct.new(:images, :crop_images, :result)
    def save(filename)
      filename = validate_filename(filename)
      result.write("../#{filename}.#{extension}")
    end

    def extension
      ".jpg"
    end

    private

    def validate_filename(filename)
      filename.gsub(/\s+/, " ").gsub(/[^0-9A-Za-z\s]/, "")
    end
  end
end
