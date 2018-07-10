require_relative "test_helper"

class RubyliteTest < Minitest::Test
  def setup
    @ob = RQuery.new
    @db = @ob.db_open('vbhv')
  end

  def test_that_it_has_a_version_number
    refute_nil ::Rubylite::VERSION
  end

  def test_rquery_class_works
    refute_nil @ob
  end

  def test_db_open_works
    refute_nil @db
  end

  def test_first_works
    assert_equal [["1", "lucifer"]], Users.first
  end

  def test_last_works
    assert_equal [['2', 'vaibhav']], Users.last
  end

  def test_take_works
    assert_equal [['1', 'lucifer'], ['2', 'vaibhav']], Users.take(2)
  end
end
