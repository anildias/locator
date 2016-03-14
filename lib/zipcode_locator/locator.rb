require 'zipcode_locator/unit'
require 'zipcode_locator/format'
require 'zipcode_locator/response'

module Locator

	def self.init(unit, format)
		[Unit.set(unit), Format.set(format)]
	end

	def self.get_response(url, format)
		case format
		when "json"
			Response.json(url)
		when "xml"
			Response.xml(url)
		when "csv"
			Response.csv(url)
		end
	end
end