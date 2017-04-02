module FlickrCollager
  class Cli
    def start
      validate_env
      puts "----- Flickr Image Collager #{FlickrCollager::VERSION} -----"
      printf "Provide keywords to search flickr API: "
      keywords = gets
      keywords = keywords.split.reject(&:empty?)
      builder = CollageBuilder.build(keywords)
      puts "----- collage have been generated -----"
      printf "provide filename: "
      filename = gets
      builder.collage.save(filename)
      puts "collage have been saved."
    rescue BuilderError => e
      puts e.message
    end

    def validate_env
      if ::FLICKR_API_KEY.nil?
        abort <<-MESSAGE
FLICKR_API_KEY wasn't setup.
Make sure to add it using `export FLICKR_API_KEY={key}`
MESSAGE
      end
    end
  end
end
