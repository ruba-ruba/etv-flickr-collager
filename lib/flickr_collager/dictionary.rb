module FlickrCollager
  class Dictionary
    DEFAULT_DICT_PATH = "/usr/share/dict/words"

    def initialize(dict_path = DEFAULT_DICT_PATH)
      @dict_path = dict_path
    end

    def sample
      dict.sample
    end

    private

    attr_reader :dict, :dict_path

    def dict
      @dict ||= File.read(dict_path).split
    end
  end
end
