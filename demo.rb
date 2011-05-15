# Load in the extension (on OS X this loads ./MyTest/mytest.bundle - unsure about Linux, possibly mytest.so)
require File.dirname(__FILE__) + '/lib/kinetosis'

# Kinetosis is now a module, so we need to include it
include Kinetosis

# Trap ^C and exit
trap("SIGINT") { exit! }

# Call and print the result from the xyz method
loop do
  c = xyz.map { |v| v.to_s.ljust(4) }
  puts "x: #{c[0]} y: #{c[1]} z: #{c[2]}"
end
