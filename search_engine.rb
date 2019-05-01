require 'benchmark'

class SearchEngine
  attr_reader :index

  def initialize()
    @index = {}
  end

  def add(document, id)
    @index[id] = document
  end

  def search(word)
    result = []
    @index.each do |id, value|
      if value.include?(word)
        result << id
      end
    end
    result
  end

  def add_inverse_index(document, id)
    document.split(" ").each do |word|
      word = word.downcase
      if !@index[word]
        @index[word] = [id]
      else
        @index[word] = @index[word] << id
      end
    end
  end

  def search_inverse_index(word)
    @index[word.downcase]
  end
end

test_string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Id nibh tortor id aliquet lectus proin. Purus ut faucibus pulvinar elementum integer enim neque volutpat. Viverra mauris in aliquam sem fringilla ut morbi. Nisl nunc mi ipsum faucibus vitae aliquet nec ullamcorper. Cursus metus aliquam eleifend mi in nulla. Ornare lectus sit amet est placerat in egestas erat. Id leo in vitae turpis massa sed elementum tempus egestas. Luctus accumsan tortor posuere ac ut consequat semper. Egestas tellus rutrum tellus pellentesque eu. Proin fermentum leo vel orci porta non pulvinar neque laoreet. Ac turpis egestas maecenas pharetra convallis posuere morbi leo urna. Cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl. Purus ut faucibus pulvinar elementum integer enim neque. Adipiscing commodo elit at imperdiet dui accumsan sit. Viverra accumsan in nisl nisi scelerisque eu. Iaculis nunc sed augue lacus viverra. Vel facilisis volutpat est velit egestas. Dolor sed viverra ipsum nunc aliquet bibendum enim. Nunc scelerisque viverra mauris in aliquam sem fringilla ut. Vestibulum morbi blandit cursus risus at. Risus nullam eget felis eget nunc lobortis mattis aliquam faucibus. Aliquam sem et tortor consequat id porta nibh venenatis cras. Luctus venenatis lectus magna fringilla urna porttitor rhoncus. Orci nulla pellentesque dignissim enim. Quam pellentesque nec nam aliquam sem et tortor consequat id. Risus at ultrices mi tempus. Nunc pulvinar sapien et ligula ullamcorper malesuada proin. Platea dictumst vestibulum rhoncus est. Dictum fusce ut placerat orci nulla pellentesque. Fusce id velit ut tortor. Quam quisque id diam vel quam elementum pulvinar. Maecenas volutpat blandit aliquam etiam erat. Amet massa vitae tortor condimentum lacinia quis vel eros.Ultrices mi tempus imperdiet nulla. Id faucibus nisl tincidunt eget. Ligula ullamcorper malesuada proin libero nunc. Pellentesque id nibh tortor id aliquet. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper sit amet. Tortor posuere ac ut consequat. Mattis pellentesque id nibh tortor id. Iaculis eu non diam phasellus vestibulum. Molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Faucibus purus in massa tempor nec feugiat nisl. Curabitur gravida arcu ac tortor dignissim convallis aenean et tortor. Molestie a iaculis at erat pellentesque adipiscing commodo elit. Vitae justo eget magna fermentum iaculis. Maecenas ultricies mi eget mauris. Ullamcorper a lacus vestibulum sed arcu non."

s = SearchEngine.new()
s.add("This is the test.", 0)
s.add("Copenhagen in the Spring.", 1)


p s.search("the")
p s.search("Munich")
p s.search("Copenhagen")
p s.search("non")

s.add_inverse_index("This is the test.", 2)
s.add_inverse_index("Copenhagen in the Spring.", 3)
p s.search_inverse_index("the")
p s.search_inverse_index("Munich")
p s.search_inverse_index("Copenhagen")
p s.search_inverse_index("non")

Benchmark.bm do |x|
  x.report {s.add(test_string, 4)}
  x.report {s.add_inverse_index(test_string, 5)}
end

Benchmark.bm do |x|
  x.report {s.search("the")}
  x.report {s.search_inverse_index("the")}
  x.report {s.search("Munich")}
  x.report {s.search_inverse_index("Munich")}
  x.report {s.search("Copenhagen")}
  x.report {s.search_inverse_index("Copenhagen")}
  x.report {s.search("non")}
  x.report {s.search_inverse_index("non")}
end
