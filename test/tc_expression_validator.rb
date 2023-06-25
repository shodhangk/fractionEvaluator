require_relative '../lib/expression_validator'
require 'test/unit'

class TestExpressionValidator < Test::Unit::TestCase
  test 'Throws error when expression is not valid' do
    assert_raises(StandardError) { ExpressionValidator.new('12/34&12 + 12').valid! }
  end

  test 'should return true when valid expression passed' do
    assert_equal(true, ExpressionValidator.new('5/3 + 1/2 - 12').valid!)
  end

  test 'throw error if expression start with operator' do
    assert_raises(StandardError) { ExpressionValidator.new('+ 12/12 + 12').valid! }
  end

  test 'throw error if expression ends with operator' do
    assert_raises(StandardError) { ExpressionValidator.new('12/12 + 12 -').valid! }
  end
end
