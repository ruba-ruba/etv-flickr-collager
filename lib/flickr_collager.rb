require "pry"
require "flickr_collager/version"
require "flickr_collager/cli"
require "flickr_collager/dictionary"
require "flickr_collager/image_downloader"
require "flickr_collager/flickr_client"
require "flickr_collager/collager"
require "flickr_collager/image_cropper"
require "flickr_collager/collage_builder"
require "flickr_collager/collage"

FLICKR_API_KEY = ENV['FLICKR_API_KEY'].freeze

module FlickrCollager
  COLLAGE_SIZE = 10.freeze
end
