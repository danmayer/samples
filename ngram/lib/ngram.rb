class Ngram
  
  attr_accessor :url, :words

  def initialize(url)
    @url = url
    @words = nil
    load_words
  end

  def load_words
    @words = RestClient.get(url).to_str.downcase.scan(/[a-z]+/)
  end

  def sentence
    words
  end

end
