require 'faraday'
require 'json'

module FlickrCollager
  class FlickrClient

    def initialize
      @api_key = ::FLICKR_API_KEY
    end

    def search_image(tag)
      response = JSON.parse(search(tag))
      response.dig("photos", "photo")
    end

    private

    def interestingness
      # There are no way to supply tag/search param to get interestingness for some keyword
      # check out
      # https://www.flickr.com/services/api/flickr.interestingness.getList.html
      # params = "?method=flickr.interestingness.getList&api_key=#{api_key}&extras=url_s&per_page=1&format=json&nojsoncallback=1&"
      # Faraday.get(base_url.concat(params)).body
    end

    def search(tag)
      params = "?method=flickr.photos.search&api_key=#{api_key}&text=#{tag}&extras=url_s&per_page=1&format=json&nojsoncallback=1"
      Faraday.get(base_url.concat(params)).body
    end

    private

    attr_reader :api_key

    def base_url
      "https://api.flickr.com/services/rest/"
    end
  end
end
