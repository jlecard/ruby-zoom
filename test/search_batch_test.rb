require 'test/unit'
require 'zoom'

class SearchBatchTest < Test::Unit::TestCase
  # Terry Reese 9-17-07
  # Test for batch results
#  def test_search_batch_test
#    ZOOM::Connection.open('z3950.loc.gov', 7090) do |conn|
#      conn.database_name = 'Voyager'
#      conn.preferred_record_syntax = 'USMARC'
#      result_set = conn.search('@attr 1=4 "Oregon"')
#      records = result_set[0..10]
#      assert_equal 10, records.length
#    end
#  end
  
  def test_multi_search
    p "going"
    connections = []
    conn1 = ZOOM::Connection.new(:host=>'z3950.loc.gov',:port=>7090,:database_name=>'Voyager',:preferered_record_syntax=>'USMARC')
    conn2 = conn1
    connections << conn1
    connections << conn2
    p.connections.inspect
    Zoom::Connection.multi_search(connections,'@attr 1=4 "Oregon"')
  end
end
