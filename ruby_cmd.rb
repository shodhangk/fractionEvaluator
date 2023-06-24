require 'readline'
require_relative 'fraction_operator'

prompt = "? "
while buf = Readline.readline(prompt, true)
  raise RuntimeError if buf == '1'
  exit if buf == 'exit'
  if buf == 'history'
    puts Readline::HISTORY.to_a
  else
    puts FractionOperator.new(buf).perform
  end
end