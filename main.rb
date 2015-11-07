require 'rubygems'
require 'nokogiri'
require 'open-uri'

print 'first_url = '
first_url = gets.chomp
page = open first_url
page_xml =  Nokogiri::XML page

file = File.open('temp/page.txt', 'w')
page_xml.xpath('//a[@href]').each do |a_elem|
	link = a_elem.attr('href')
	file.write "#{link}\n" if link[0] != '#'
end
file.close()