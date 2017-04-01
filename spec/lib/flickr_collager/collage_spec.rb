require "spec_helper"

module FlickrCollager
  RSpec.describe Collage do
    it "respond to save" do
      expect(subject).to respond_to(:save)
    end
  end
end
