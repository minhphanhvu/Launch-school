require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @sample_text = File.open('sample_text_2.txt')
    @content = @sample_text.read
    @text = Text.new(@content)
  end

  def test_swap
    swap_content = @content.gsub('e', 'i')
    assert_equal(swap_content, @text.swap('e', 'i'))
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @sample_text.close
  end
end
