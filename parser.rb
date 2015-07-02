## parser.rb by Baron Bloomer
# The following script has been written for the purposes of test and review by Smart Pension.
#
# I certify that all work in this document is my own.

@unsorted_web_addresses = []

File.open( 'webserver.log' ).each do |line|
    @unsorted_web_addresses << {:page => line.split(' ').first, :ip => line.split(' ').last}
end

@unsorted_web_addresses