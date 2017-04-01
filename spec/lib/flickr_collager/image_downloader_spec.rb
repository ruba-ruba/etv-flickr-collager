require "spec_helper"

module FlickrCollager
  RSpec.describe ImageDownloader do
    describe "#images" do
      let(:keywords) { %w(one two three) }
      let(:flickr_client) { double(:flickr_client, photos: []) }

      subject do
        described_class.new(keywords, flickr_client).images
      end

      it "query flickr client 3 times for image" do
        expect(flickr_client).to receive(:search_image).exactly(keywords.size).times
        subject
      end
    end
  end
end
