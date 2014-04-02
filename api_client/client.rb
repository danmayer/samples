# encoding: UTF-8
require 'rest_client'
require 'csv'

FORMAT = 'CSV'
OUTPUT_FILE = "data.csv"

# we found these apis on https://business.usa.gov/apis
data = RestClient.get "http://business.usa.gov/api/ss/#{FORMAT}"

#fix data formatting
data = data.force_encoding('BINARY').encode('UTF-8', :invalid => :replace, :undef => :replace, :replace => '').delete!("\r").gsub(/\" \n/,"\"\n").gsub(/\\\"/,"__")

# write data to a file
# File.open(OUTPUT_FILE, "w") {|f| f.write(data) }

count = 0
CSV.parse(data) do |row|
  puts row if count == 5
  count += 1
end

puts "There are #{count} rows in this CSV file"

# require "json"
# data = RestClient.get "http://localhost:4567"
# puts data
# parsed_data = JSON.parse(data)
# puts parsed_data['key']
