require 'zipcode_locator/response'

module Locator

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