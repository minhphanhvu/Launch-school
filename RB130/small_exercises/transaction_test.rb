require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(50)
  end

  def test_prompt_for_payment
    input = StringIO.new("80\n")
    output = <<~HEREDOC
      You owe $50.\nHow much are you paying? 
    HEREDOC
    assert_output(output) { @transaction.prompt_for_payment(input: input) }
  end
end