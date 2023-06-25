require_relative '../fraction_operator'
require 'test/unit'

class TestFractionOperator < Test::Unit::TestCase
  test 'Retunrns nil when when expression is not valid' do
    assert_equal(nil, FractionOperator.new('12/34&12 + 12').perform)
  end

  test 'Perform test for two operand expression' do
    assert_equal('1&7/8', FractionOperator.new('1/2 * 3&3/4').perform)
    assert_equal('3&1/2', FractionOperator.new('2&3/8 + 9/8').perform)
    assert_equal('-1/4', FractionOperator.new('1&3/4 - 2').perform)
    assert_equal('-1&1/2', FractionOperator.new('3/4 / -1/2').perform)
  end

  test 'Perform test for three operand expression' do
    assert_equal('2&1/4', FractionOperator.new('1/2 * 1/2 + 2').perform)
    assert_equal('3&1/6', FractionOperator.new('2&3/8 + 9/8 - 1/3').perform)
    assert_equal('-1/4', FractionOperator.new('1&3/4 - 2 / 1').perform)
    assert_equal('-1/8', FractionOperator.new('3/4 / -1/2 * 12').perform)
  end
end
