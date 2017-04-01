require "spec_helper"

module FlickrCollager
  RSpec.describe Collager do
    describe "#execute" do
      let(:images) do
        Array.new(10) { FlickrCollager::Collager::Image.new(1, 1) }
      end

      subject(:execute) do
        described_class.new(images).execute
      end

      it "wokrds" do
        expect { execute }.not_to raise_exception
      end

      it "return ImageMagic object" do
        expect(execute.class).to eq Magick::Image
      end
    end
  end
end
