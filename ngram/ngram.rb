# encoding: UTF-8
require 'rest_client'
require_relative 'lib/ngram'

unless ARGV.length > 0
  puts "usage: `ruby ngram url`"
else
  url = ARGV[0]
  puts "building an Ngram from #{url}"
  ngram = Ngram.new(url)
  puts ngram.words.inspect
end
