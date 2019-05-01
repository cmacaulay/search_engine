class SearchEngine
  attr_reader :index

  def initialize()
    @index = {}
  end

  def add(document, id)
    document.split(" ").each do |word|
      word = word.downcase
      if !@index[word]
        @index[word] = [id]
      else
        @index[word] = @index[word] << id
      end
    end
  end

  def search(word)
    @index[word.downcase]
  end
end

s = SearchEngine.new()
s.add("This is the test.", 1)
s.add("Copenhagen in the Spring.", 15)
p s.search("the")
p s.search("Munich")
p s.search("Copenhagen")
