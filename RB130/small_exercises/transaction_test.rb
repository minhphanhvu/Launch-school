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
    output = StringIO.new
    # output = <<~HEREDOC
    #   You owe $50.
    #   How much are you paying? 
    # HEREDOC
    # assert_output(output) { @transaction.prompt_for_payment(input: input) }
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(80, @transaction.amount_paid)
  end

  
end