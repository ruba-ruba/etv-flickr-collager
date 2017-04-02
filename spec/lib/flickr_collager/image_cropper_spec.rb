require "spec_helper"

module FlickrCollager
  RSpec.describe ImageCropper do
    describe "#crop" do
      let(:images) do
        Array.new(5) { Tempfile.new }
      end

      before do
        allow(FlickrCollager::ImageCropper::Image).to receive(:read) { double(:null).as_null_object }
        allow_any_instance_of(FlickrCollager::ImageCropper::Image).to receive(:resize)
      end

      subject(:crop) do
        described_class.new(images).crop
      end

      it "works" do
        expect { crop }.not_to raise_exception
      end

      it "close tmp files" do
        crop
        expect(images.all?(&:closed?)).to be_truthy
      end
    end
  end
end
