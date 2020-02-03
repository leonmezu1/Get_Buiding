# frozen_string_literal: true

# creation complete

require 'json'
require 'rest-client'

def cls
  system clear
end

def ask
  string = gets.chomp
  string.split(' ').join('+')
end

def search(query)
  url = "https://www.bing.com/search?q=#{query}"
  response = RestClient.get(url)
  # parsed = JSON.parse(response)

  if response.code.eql?(200)
    puts 'The page is responding... OK - STATUS'
    puts 'The parsed page info is:'

  else
    puts 'The page is not responding... STATUS - FAILURE'
  end
end

puts "Enter your search please!\n"
query = ask
search(query)
