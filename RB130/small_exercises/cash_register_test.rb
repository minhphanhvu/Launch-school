require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(50)
    @transaction.amount_paid = 100
    @cash_register = CashRegister.new(1000)
  end

  def test_accept_money
    assert_equal(@cash_register.total_money + 100, @cash_register.accept_money(@transaction))
  end

  def test_change
    change = 50
    assert_equal(change, @cash_register.change(@transaction))
  end

  def test_give_receipt
    output = "You've paid $50.\n"
    assert_output(output) { @cash_register.give_receipt(@transaction) }
  end
end
