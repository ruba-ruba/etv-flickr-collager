require "pry"
require "flickr_collager/version"
require "flickr_collager/cli"
require "flickr_collager/dictionary"
require "flickr_collager/image_downloader"
require "flickr_collager/flickr_client"
require "flickr_collager/collager"
require "flickr_collager/image_cropper"

FLICKR_API_KEY = ENV['FLICKR_API_KEY']

module FlickrCollager
  COLLAGE_SIZE = 10.freeze
end
