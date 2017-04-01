module FlickrCollager
  class KeywordFetcher
    COLLAGE_SIZE = 10
    DEFAULT_DICT_PATH = "/usr/share/dict/words"

    attr_reader :dict, :dict_path

    def initialize(dict_path = DEFAULT_DICT_PATH)
      @dict_path = dict_path
    end

    def prepare(keywords)
      keywords = keywords.uniq
      return keywords.first(10) if keywords.size >= COLLAGE_SIZE
      keywords << dict.sample
      prepare(keywords)
    end

    private

    def dict
      @dict ||= File.read(dict_path).split
    end
  end
end
