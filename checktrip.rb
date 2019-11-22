#!/usr/bin/env ruby

require '/usr/local/bin/checktrip_program.rb'

if ARGV.length == 0
  puts Checktrip.new.perform
  exit
elsif ARGV.length == 2
  puts Checktrip.new(ARGV[0], ARGV[1]).perform
else
  puts "invalid checktrip command."
  puts "input 'checktrip' to get all stations."
  puts "input 'checktrip STATION_X STATION_Y' to check availability."
end