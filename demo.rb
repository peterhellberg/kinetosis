# Load in the extension (on OS X this loads ./MyTest/mytest.bundle - unsure about Linux, possibly mytest.so)
require './lib/kinetosis'

# Kinetosis is now a module, so we need to include it
include Kinetosis

# Trap ^C and exit
trap("SIGINT") { exit! }

unless has_sudden_motion_sensor?
  puts "ERROR: Are you sure that your machine has a Sudden Motion Sensor?"
else
  # Call and print the result from the xyz method
  loop do
    c = xyz.map { |v| v.to_s.ljust(4) }
    puts "x: #{c[0]} y: #{c[1]} z: #{c[2]}"
  end
end

