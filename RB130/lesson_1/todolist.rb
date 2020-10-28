# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation
  attr_accessor :todos

  def add(todo)
    if todo.class == Todo
      self.todos.append(todo)
    else
      raise "Can only add Todo objects"
    end
  end

  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last 
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.each do |todo|
      return false if todo.done?
    end
    true
  end

  def item_at(index)
    raise IndexError if index >= todos.size || index < 0
    todos[index]
  end

  def mark_done_at(index)
    raise IndexError if index >= todos.size || index < 0
    todos[index].done!
  end

  def mark_undone_at(index)
    raise IndexError if index >= todos.size || index < 0
    todos[index].undone!
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    raise IndexError if index >= todos.size || index < 0
    todos.delete_at(index)
  end

  def to_s
    text = "---#{title}----"
    todos.each { |todo| puts todo }
    text
  end

  def each
    counter = 0

    while counter < todos.size
      yield(todos[counter])
      counter += 1
    end

    self
  end

  def select
    list = TodoList.new

    each do |todo|
      list.add(todo) << todo if yield(todo)
    end
    list
  end

  def find_by_title(title)
    each do |todo|
      if title == todo.title
        return todo
      end
    end
    nil
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end
end
# ---- Adding to the list -----
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

p list
p list.find_by_title('Buy milk')
p list.mark_done('Buy milk')
p list

