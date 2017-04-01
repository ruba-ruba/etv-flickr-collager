require "spec_helper"

module FlickrCollager
  RSpec.describe CollageBuilder do
    let(:collage_builder) { described_class.new([]) }

    subject(:build) do
      collage_builder.build
    end

    before do
      allow_any_instance_of(ImageDownloader).to receive(:preload)
    end

    describe "build process" do
      it do
        expect_any_instance_of(ImageDownloader).to receive(:preload).once
        expect_any_instance_of(ImageDownloader).to receive(:images).once { ["orig-image"] }
        expect_any_instance_of(ImageCropper).to receive(:crop).once { ["crop-image"] }
        expect_any_instance_of(Collager).to receive(:execute).once  { "collage-result" }
        build
        expect(collage_builder.collage.result).to eq "collage-result"
      end

      context "when download error occur" do
        before do
          allow_any_instance_of(Collage).to receive(:images).and_return([])
        end

        it "raise error when build process goes wrong" do
          expect { build }.to raise_error(FlickrCollager::BuilderError, "images not yet downloaded")
        end
      end

      context "when crop error occur" do
        before do
          allow_any_instance_of(Collage).to receive(:images).and_return(["orig-image"])
          allow_any_instance_of(described_class).to receive(:crop_images)
          allow_any_instance_of(Collage).to receive(:crop_images).and_return([])
        end

        it "raise error when build process goes wrong" do
          expect { build }.to raise_error(FlickrCollager::BuilderError, "images not yet cropped")
        end
      end
    end
  end
end
