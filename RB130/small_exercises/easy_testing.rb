require 'minitest/autorun'

class BaloonTest < MiniTest::Test
  def test_odd?
    assert(1.odd?, "Not an odd value")
  end
end

class StringTest < MiniTest::Test
  def test_downcase
    assert_equal('xyz', 'XYz'.downcase)
  end
end

class NilTest < MiniTest::Test
  def test_not_nil
    value = nil
    assert_nil(nil, value)
  end
end

class ListTest < MiniTest::Test
  def test_empty_list
    list = []
    assert_empty(list, "This collection is not empty")
  end

  def test_include
    list = [1, 2, 3]
    assert(list.include?(1), 'Collection does not include the item')
  end
end

class NoExperienceError < StandardError
end

class Employee
  def hire
    raise NoExperienceError
  end
end

class ExceptionTest < MiniTest::Test
  def setup
    @employee = Employee.new
  end

  def test_hire
    assert_raises(NoExperienceError) { @employee.hire }
  end
end

class TypeTest < MiniTest::Test
  def test_instance_of
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end

  def test_kind_of
    assert_kind_of(Numeric, 1)
  end
end

class RefutationTest < MiniTest::Test
  def test_refute_include
    arr = [1, 2, 3]
    value = 4
    refute(arr.include?(value))
  end
end
