=begin
  - write: added,
  - read: return and remove
  - First in firs out (FIFO) = queue
=end

class CircularBuffer
  attr_accessor :size, :queue

  def initialize(size)
    @size = size
    @queue = []
  end

  def read
    empty? ? raise(BufferEmptyException) : queue.shift
  end

  def write(ele)
    raise BufferFullException if full?
    queue << ele if !ele.nil?
  end

  def clear
    self.queue = []
  end

  def write!(ele)
    if !ele.nil?
      if full?
        queue.shift
      end
      queue << ele
    end
  end

  private

  def empty?
    queue.empty?
  end

  def full?
    queue.size >= size
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
