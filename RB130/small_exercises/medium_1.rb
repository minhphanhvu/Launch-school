# p1
p "p1---"

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    if block_given?
      record(yield)
    end
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"

# p2
p "p2---"

class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\r\n\r\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }

# p3
p "p3---"

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |list| puts list.join(', ') }

#p4 
p "p4---"

def parse_2(array)
  yield(array)
end

parse_2(%w(raven finch hawk eagle)) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(' ')}"
end