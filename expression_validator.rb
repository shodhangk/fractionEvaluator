## Validation testcases
# 1. Allowed chars [*/+-&- 1-9]  data = a.match(/^[-\+\*\/&+\d\s]*$/).nil?
# 2. identify the position of operators. should be at the middle of operands
# 3. Validate the operands => shoudl contain only  [0-9], & , /
require 'test/unit'

class ExpressionValidator
  def initialize(input)
    @input = input
  end

  def valid!
    return false if @input.match(%r{^[-+*/&+\d\s]*$}).nil?

    values = @input.split(%r{\s(-|\+|/|\*)\s})
    values.each_with_index do |value, index|
      if index.even? && !is_valid_fraction(value)
        raise StandardError, 'Invalid expression'
      elsif index.odd? && (value.length != 1 || !value.match(%r{[+-/*]}))
        raise StandardError, 'Operators should be sorrounded by operands'
      elsif index == values.size - 1 && value.length == 1 && value.match(%r{[+-/*]})
        raise StandardError, 'Expression should end with operand not operator'
      end
    end
    true
  end

  def is_valid_fraction(value)
    value.strip!
    !value.match(%r{(^-?\d+$)|(^-?\d+/\d+$)}).nil? ||
      !value.match(%r{^-?(\d+&\d+/\d+)$}).nil?
  end
end
