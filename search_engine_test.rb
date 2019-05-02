require 'minitest/autorun'
require_relative 'search_engine'
class SearchEngineTest < Minitest::Test
  def test_search_engine_initializes
    search_engine = SearchEngine.new

    assert_equal SearchEngine, search_engine.class
    assert_equal Hash.new, search_engine.index
  end

  def test_index_implementation_will_add_and_search
    search_engine = SearchEngine.new

    search_engine.add("This is the first test.", 0)
    index = search_engine.index

    assert_equal "This is the first test.", index[0]
    assert_equal [0], search_engine.search("the")
  end

  def test_index_will_add_and_search
    search_engine = SearchEngine.new
    # note: edge case, punctuation needs to be stripped
    search_engine.add_inverse_index("Copenhagen in the Spring", 3)
    index = search_engine.index

    assert_equal [3], index["copenhagen"]
    assert_equal [3], index["spring"]

    search_engine.add_inverse_index("This is the second test.", 0)

    assert_equal [3, 0], search_engine.search_inverse_index("the")
  end
end
