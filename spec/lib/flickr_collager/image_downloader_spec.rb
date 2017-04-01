require "spec_helper"

module FlickrCollager
  RSpec.describe ImageDownloader do
    describe "#preload" do
      let(:keywords) { %w(one two three) }
      let(:flickr_client) do
        double(:flickr_client, search_image: { "url_s" => "url_s" })
      end

      subject do
        described_class.new(keywords, flickr_client).preload
      end

      before do
        stub_const("FlickrCollager::ImageDownloader::COLLAGE_SIZE", 2)
        allow(Faraday).to receive(:get) { double(:response, body: "content") }
      end

      it "query flickr client not more then COLLAGE_SIZE times" do
        expect(flickr_client).to receive(:search_image).exactly(2).times
        subject
      end
    end
  end
end
