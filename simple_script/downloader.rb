#!/usr/bin/env ruby

BASE_URL = 'https://raw2.github.com/danmayer/samples/master/sinatra_example/'
FILES = ['Gemfile', 'Gemfile.lock', 'Rakefile', 'app.rb', 'config.ru', 'test/app_test.rb']

unless File.exists?('../sinatra_example')
  `mkdir ../sinatra_example`
  `mkdir ../sinatra_example/test`
end

FILES.each do |file|
  `wget -O "../sinatra_example/#{file}" "#{BASE_URL}#{file}"`
end
