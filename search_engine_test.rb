require 'minitest/autorun'
require_relative 'search_engine'
class SearchEngineTest < Minitest::Test
  def test_search_engine_initializes
    search_engine = SearchEngine.new()
    assert_equal SearchEngine, search_engine.class
    assert_equal Hash.new, search_engine.index
  end
end
