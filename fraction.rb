# Fraction class which will allow perform arithmetic operatin on fractions passed sa String
# @Input: Takes Mixed and Improper Fraction as input and stores as Improper fraction

class Fraction
  attr_reader :numerator, :denominator

  def initialize(operand)
    raise ArgumentError unless is_valid_fraction(operand)

    @value = to_improper(operand)
    init_num_den
  end

  # Arithemetic operations

  def add(frac)
    Fraction.new("#{numerator *  frac.denominator + denominator * frac.numerator}/#{denominator * frac.denominator}")
  end

  def sub(frac)
    Fraction.new("#{numerator *  frac.denominator - denominator * frac.numerator}/#{denominator * frac.denominator}")
  end

  def mul(frac)
    Fraction.new("#{numerator * frac.numerator}/#{denominator * frac.denominator}")
  end

  def div(frac)
    if frac.numerator.negative?
      Fraction.new("-#{numerator * frac.denominator}/#{denominator * frac.numerator.abs}")
    else
      Fraction.new("#{numerator * frac.denominator}/#{denominator * frac.numerator}")
    end
  end

  # A mixed fraction is a combination of a proper fraction and a whole number
  def to_mix
    # division not works properly for negative integer
    whole_number = numerator.abs / denominator
    remainder =  numerator.abs % denominator
    minus = numerator.negative? ? '-' : ''
    if remainder.zero?
      "#{minus}#{whole_number}"
    elsif !whole_number.zero?
      "#{minus}#{whole_number}&#{remainder}/#{denominator}"
    else
      @value
    end
  end

  # improper fraction is a fraction where the numerator is greater than or equal to the denominator.
  def to_improper(operand)
    return operand unless operand.include?('&')

    values = operand.split(%r{[/&]})
    values.map! { |item| item.to_i.abs }
    improper = "#{values[0] * values[2] + values[1]}/#{values[2]}"
    return "-#{improper}" if operand.include?('-')

    improper
  end

  def to_s
    return numerator.to_s if denominator == 1

    "#{numerator}/#{denominator}"
  end

  private

  def is_valid_fraction(value)
    !value.match(%r{(^-?\d+$)|(^-?\d+/\d+$)}).nil? ||
      !value.match(%r{^-?(\d+&\d+/\d+)$}).nil?
  end

  def init_num_den
    denominator = @value.split('/')[1].nil? ? 1 : @value.split('/')[1].to_i
    numerator = @value.split('/')[0].to_i
    common_divisor = numerator.gcd(denominator)
    @numerator = numerator / common_divisor
    @denominator = denominator / common_divisor
  end
end
