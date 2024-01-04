#!/usr/bin/env ruby
# script should output: [SENDER],[RECEIVER],[FLAGS].
# The sender phone number or name (including country code if present)
# The receiver phone number or name (including country code if present)
# The flags that were used

from  = ARGV[0].scan(/from:(\+?\w*)/).join
to    = ARGV[0].scan(/to:(\+?\w*)/).join
flags = ARGV[0].scan(/flags:(-?\d:-?\d:-?\d:-?\d:-?\d)/).join
puts "#{from},#{to},#{flags}"
