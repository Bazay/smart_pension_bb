## parser.rb by Baron Bloomer
# The following script has been written for the purposes of test and review by Smart Pension.
#
# I certify that all work in this document is my own.
puts "'parser.rb' created by Baron Bloomer\n\n"

#Global variables
@most_visited = []
@most_unique = []
@unsorted_web_addresses = []

#Load dataset from file
puts "Reading dataset from webserver.log\n\n"
File.open( 'webserver.log' ).each do |line|
    @unsorted_web_addresses << {:page => line.split(' ').first, :ip => line.split(' ').last}
end

## MOST VISITED
#Calc most visited
@most_visited = @unsorted_web_addresses.group_by{|x|x[:page]}.inject({}){|hash, (k,v)| hash.merge( k => v.length)}.sort_by{|k,v|v}.reverse.to_h

#Output most visited in a readable format
puts "1. Most visits per URL in descending order:\n"
@most_visited.each{|k,v| puts "#{k}\n#{v}\n"}

## MOST UNIQUE
#Calc most unique
@most_unique = @unsorted_web_addresses.group_by{|x|x[:page]}.inject({}){|hash, (k,v)| hash.merge( k => v.uniq.length)}.sort_by{|k,v|v}.reverse.to_h

#Output most unique in a readable format
puts "\n2. Most unique visits per URL in descending order:\n"
@most_unique.each{|k,v| puts "#{k}\n#{v}\n"}

puts "\nEND OF SCRIPT"