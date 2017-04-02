## FlickrCollager


#### Installation

- clone gem `git clone git@github.com:ruba-ruba/flickr_collager.git`

- navigate `cd flickr_collager`

- run `bundle`

- install dependencies `bundle exec rake install`

- FlickrCollager depends on rmagic.
 Make sure you installed `libmagickwand-dev`. See for details [rmagick](https://github.com/rmagick/rmagick)

- setup flickr api key environment variable `export FLICKR_API_KEY={your_key_goes_here}`


#### Usage

run `bin/flickr_collager` within root folder of gem

provide keywords to download images from flickr & wait a bit

after provider filename for collage.

The newly created image is stored on gem folder level (`../`).


#### Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

#### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ruba_ruba/flickr_collager. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


#### License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

