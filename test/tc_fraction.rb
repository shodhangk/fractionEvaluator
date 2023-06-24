require_relative '../fraction'
require 'test/unit'

class TestFraction < Test::Unit::TestCase
  test 'Fraction throws error when invalid input' do
    assert_raises(ArgumentError) { Fraction.new('12/34&12') }
  end

  test 'Converts mixed fraction into improper fraction after intiliaze' do
    assert_equal('23/12', Fraction.new('1&11/12').to_s)
  end

  test 'test numerator intialization' do
    assert_equal(1, Fraction.new('1/12').numerator)
    assert_equal(23, Fraction.new('1&11/12').numerator)
  end

  test 'test denominator intialization' do
    assert_equal(12, Fraction.new('1/12').denominator)
    assert_equal(12, Fraction.new('1&11/12').denominator)
  end

  test 'test addition of two fractions' do
    frac1 = Fraction.new('1/2')
    frac2 = Fraction.new('1/2')
    frac3 = Fraction.new('2&1/4')
    frac4 =  Fraction.new('-2&1/4')
    assert_equal('1', frac1.add(frac2).to_s)
    assert_equal('11/4', frac1.add(frac3).to_s)
    assert_equal('-7/4', frac1.add(frac4).to_s)
  end

  test 'test substraction of two fractions' do
    frac1 = Fraction.new('1/2')
    frac2 = Fraction.new('1/2')
    frac3 = Fraction.new('2&2/5')
    frac4 = Fraction.new('-2&1/3')
    assert_equal('0', frac1.sub(frac2).to_s)
    assert_equal('-19/10', frac1.sub(frac3).to_s)
    assert_equal('17/6', frac1.sub(frac4).to_s)
  end

  test 'test multiplication of two fractions' do
    frac1 = Fraction.new('1/2')
    frac2 = Fraction.new('1/2')
    frac3 = Fraction.new('2&2/5')
    frac4 = Fraction.new('-2&1/3')
    assert_equal('1/4', frac1.mul(frac2).to_s)
    assert_equal('6/5', frac1.mul(frac3).to_s)
    assert_equal('-28/5', frac3.mul(frac4).to_s)
  end

  test 'test division of two fractions' do
    frac1 = Fraction.new('1/2')
    frac2 = Fraction.new('1/2')
    frac3 = Fraction.new('2&2/5')
    frac4 = Fraction.new('-2&1/3')
    assert_equal('1', frac1.div(frac2).to_s)
    assert_equal('5/24', frac1.div(frac3).to_s)
    assert_equal('-3/14', frac1.div(frac4).to_s)
  end
end
