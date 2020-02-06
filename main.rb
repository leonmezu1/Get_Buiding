# frozen_string_literal: true

# creation complete

require 'json'
require 'rest-client'
require 'nokogiri'
require 'http'

def cls
  system clear
end

def ask
  string = gets.chomp
  asked = string.to_s.split(' ').join('+')
  asked
end

def search(query)
  url = "https://www.bing.com/search?q=#{query}"
  response = RestClient.get(url)
<<<<<<< Updated upstream
  parsed = Nokogiri::HTML.parse(response.body)

  if response.code.eql?(200)
    puts 'The page is responding... OK - STATUS'
    puts 'The parsed page info is:'
    parsed.css("a li ol").each do |content|
      puts "\tsearch:#{content.text}\tlink:#{content[:href]}\n"
    end

=======
  # parsed = JSON.parse(response.headers)

  if response.code.eql?(200)
    puts 'The page is responding... OK - STATUS'
    puts 'The page info is:'
		response.headers.each do |key, value|
			puts "#{key}: #{value}\n\n\n"
		end 
    # puts response.headers
    # puts response.cookies
    # puts response.body
>>>>>>> Stashed changes
  else
    puts 'The page is not responding... STATUS - FAILURE'
  end
end

puts "Enter your search please!\n"
query = ask
search(query)
