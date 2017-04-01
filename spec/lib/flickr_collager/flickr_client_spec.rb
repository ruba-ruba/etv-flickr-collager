require "spec_helper"

module FlickrCollager
  RSpec.describe FlickrClient do
    describe "#search_image" do
      let(:response) do
        {
          "photos"=> {
             "photo"=> [
                { "url"=>"image_url.jpg" }
              ]
          }
        }
      end

      before do
        allow_any_instance_of(described_class).to receive(:search).and_return response.to_json
      end

      subject { described_class.new.search_image('tag') }

      it "return photo array" do
        expected = [{"url"=>"image_url.jpg"}]
        expect(subject).to eq expected
      end
    end
  end
end
