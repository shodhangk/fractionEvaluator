require_relative 'expression_validator'
require_relative 'fraction'

class FractionOperator
  def initialize(input)
    @input = input.strip
  end

  def perform
    ExpressionValidator.new(@input).valid!
    values = @input.split(%r{\s(-|\+|/|\*)\s})
    values = convert_to_frac_expression(values)
    result = evaluate(values)
    result.to_mix
  rescue StandardError => e
    puts e.message
    puts e.backtrace.first(3)
  end

  private

  def convert_to_frac_expression(values)
    values.map(&:strip).map.with_index do |ele, index|
      if index.even?
        Fraction.new(ele)
      else
        ele
      end
    end
  end

  def evaluate(array)
    return array[0] if array.size == 1

    operators = ['*', '/', '-', '+']
    operators.each do |operator|
      loop do
        index = array.find_index(operator)
        break if index.nil?

        output = calculate(operator, array[index - 1], array[index + 1])
        array[index - 1..index + 1] = [output]
      end
    end
    array[0]
  end

  def calculate(operator, operand1, operand2)
    case operator
    when '+'
      operand1.add(operand2)
    when '-'
      operand1.sub(operand2)
    when '*'
      operand1.mul(operand2)
    when '/'
      operand1.div(operand2)
    end
  end
end
