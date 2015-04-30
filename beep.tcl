#!/bin/sh
# the next line restarts using wish \
exec wish8.4 "$0" -display :0 -geometry 1x1+0+0
puts "Content-Type: text/plain\n"
puts [clipboard get]
puts [selection get]
exit

