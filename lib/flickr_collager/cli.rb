module FlickrCollager
  class Cli
    def start
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
  end
end
