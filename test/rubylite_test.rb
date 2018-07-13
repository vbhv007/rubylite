require "test_helper"

class RubyliteTest < Minitest::Test
  def setup
    @ob = Rubylite.new
    @db = @ob.db_open('vbhv')
  end

  def test_rquery_class_works
    refute_nil @ob
  end

  def test_db_open_works
    refute_nil @db
  end

  def test_first_works
    assert_equal [["1", "lucifer"]], User.first
  end

  def test_last_works
    assert_equal [['2', 'vaibhav']], User.last
  end

  def test_take_works
    assert_equal [['1', 'lucifer'], ['2', 'vaibhav']], User.take(2)
  end
end
