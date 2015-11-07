require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'set'

def set_of_links(url)
	links = Set.new

	page = open url
	page_xml =  Nokogiri::XML page

	page_xml.xpath('//a[@href]').each do |a_elem|
		link = a_elem.attr('href') 
		links.add link if link[0] != '#'
	end

	links
end

def set_to_file(set, filename) 
	File.open(filename, 'w') do |f|
		set.each do |elem|
			f.write "#{elem}\n"
		end
	end
end


print 'first_url = '
first_url = gets.chomp
filename = 'temp/page.txt'

set_to_file set_of_links(first_url), filename
