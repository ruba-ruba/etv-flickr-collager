require "spec_helper"

module FlickrCollager
  describe KeywordFetcher do
    let(:test_dict_path) { ("spec/fixtures/test_dict.txt") }
    let(:keywords_given) { %w(One Two Three) }

    subject do
      described_class.new(test_dict_path).prepare(keywords_given)
    end

    describe "#prepare" do
      it "return ary" do
        expect(subject).to be_instance_of Array
      end

      it "return array with exactly 10 items" do
        expect(subject.size).to eq 10
      end

      context "when supplied more then 10 args" do
        let(:keywords_given) do
          %w(
            one
            one
            one
            one
            two
            three
            four
            five
            six
            seven
            eight
            nine
            ten
            eleven
            twelve
            thirteen
            )
        end

        it "return exactly 10 items" do
          expect(subject.size).to eq 10
        end

        it "return ary contain uniq items" do
          expect(subject.sort).to eq %w(one two three four five six seven eight nine ten).sort
        end
      end
    end
  end
end
