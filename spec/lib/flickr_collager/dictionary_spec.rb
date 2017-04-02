require "spec_helper"

module FlickrCollager
  RSpec.describe Dictionary do
    let(:test_dict_path) { "spec/fixtures/test_dict.txt" }

    subject do
      described_class.new(test_dict_path).sample
    end

    describe "#sample" do
      it "load dict & return random item" do
        expect(subject).to be_instance_of String
      end
    end
  end
end
