# frozen_string_literal: true

# creation complete

require 'json'
require 'rest-client'
require 'nokogiri'
require 'http'
require 'open-uri'

def cls
  system clear
end

def ask
  string = gets.chomp
  asked = string.to_s.split(' ').join('+')
  asked
end

# rubocop: disable Metrics/MethodLength
def search(query)
  url = "https://www.bing.com/search?q=#{query}"
  response = RestClient.get(url)
  parsed = Nokogiri::HTML.parse(response.body)

  if response.code.eql?(200)
    puts 'The page is responding... OK - STATUS'
    puts 'The parsed page info is:'
    parsed.css('ul li h2 a').each do |link|
      puts "#{link.text}\t#{link[:href]}"
      puts ''
    end
  else
    puts 'The page is not responding... STATUS - FAILURE'
  end
end
# rubocop: enable Metrics/MethodLength

puts "Enter your search please!\n"
query = ask
search(query)
