require 'simplecov'
require 'minitest/autorun'
require "minitest/reporters"

SimpleCov.start
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    @todo1.done!
    assert_equal(true, @todo1.done?)
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('string')}
  end

  def test_add
    new_todo = Todo.new("Walk the dog")
    @list << new_todo
    @todos << new_todo

    assert_raises(TypeError) { @list.add(1) }
    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias 
    todo4 = Todo.new("Pharmacy")
    @list.add(todo4)
    @todos << todo4

    assert_equal(@list.to_a, @todos)
  end

  def item_at
    assert_raises(IndexError) { @list.item_at(4) }
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(4) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(4) }
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(4) }
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_todo
    @todo1.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_each_iteration
    new_list = []
    @list.each { |todo| new_list << todo }
    assert_equal(@list.to_a, new_list)
  end

  def test_each_original
    new_list = []
    value = @list.each { |todo| new_list << todo }
    assert_equal(@list, value)
  end

  def test_select_return
    new_list = @list.select { |todo| todo.done? }
    assert_equal([], new_list.todos)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(4) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_all_done
    @todo1.done!
    @todo3.done!
    list_test = TodoList.new("Today's Todos")
    list_test.add(@todo1)
    list_test.add(@todo3)
    assert_equal(list_test.todos, @list.all_done.todos)
  end

  def test_all_not_done
    @todo2.done!
    list_test = TodoList.new("Today's Todos")
    list_test.add(@todo1)
    list_test.add(@todo3)
    assert_equal(list_test.todos, @list.all_not_done.todos)
  end

  def test_mark_done
    assert_equal(true, @list.find_by_title("Buy milk") && @list.find_by_title("Buy milk").done!)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_mark_all_undone
    @list.mark_all_undone
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
  end
end